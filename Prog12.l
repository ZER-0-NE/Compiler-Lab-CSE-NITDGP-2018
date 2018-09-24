%{
#include<stdio.h>
#include<string.h>
char temp1[1000];
char temp2[1000];
int count=0,c;
int i,j,k;
int rev(char* s);	
%}

%%
[a-zA-Z]+ {if(rev(yytext)==1) {printf("%s\n",yytext);count++;}}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin=fopen("abc.txt","r");
	yyout=fopen("abcd.txt","w");
	yylex();
	printf("\nCount is: %d\n",count);
	return 0;
}

int rev(char* s)
{
    c=0;
	for(i=0;i<strlen(s);i++)
	   temp1[i]=s[i];
	for(j=strlen(s)-1;j>=0;j--)
	   temp2[strlen(s)-1-j]=s[j];
	for(k=0;k<strlen(s);k++)
	{
	   if(temp1[k]==temp2[k])
	   {
	      c++;
	   }
	}
	if(c==strlen(s))
	return 1;
	else
	return 0;
}