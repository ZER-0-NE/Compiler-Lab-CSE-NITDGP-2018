%{
   #include<stdio.h>
   #include<string.h>
   int c1=0,c2=0;
   int c;
   FILE *f1,*f2;	
%}

%%
[0-9]+ {c=atoi(yytext); if(c%2==0) {c1++; fprintf(f1,"%d\n",c);} else {c2++; fprintf(f2,"%d\n",c);}}
%%

int yywrap() {return 1;}

int main(void)
{
	extern FILE *f1,*f2,*yyin;
	f1 = fopen("abcd.txt","w");
	f2 = fopen("abcde.txt","w");
	yyin = fopen("abc.txt","r");
	yylex();
	printf("count of even is:%d\n",c1);
	printf("count of odd is:%d\n",c2);
	return 0;
}