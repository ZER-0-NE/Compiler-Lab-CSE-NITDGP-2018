%{
   #include<stdio.h>
   #include<string.h>
   int longest=0;
   int i;
   char longword[100];
   char reLongWord[100];
   void rev(char* s);	
%}

%%
[a-zA-z]+ {if(strlen(yytext)>longest) {longest=strlen(yytext); strcpy(longword,yytext);}}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin = fopen("abc.txt","r");
	yylex();
	printf("Longest word is :%s\n",longword);
	rev(longword);
	return 0;
}

void rev(char* s)
{
	for(i=strlen(s)-1;i>=0;i--)
	{
       reLongWord[strlen(s)-1-i] = s[i];
	}
	printf("Reverse is:%s\n",reLongWord);
}