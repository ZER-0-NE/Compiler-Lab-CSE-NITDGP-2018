%{
	#include<ctype.h>
	int iscomment=0;
	int isMLC=0;
	void cap(char*);
%}

%%
"//" {printf("//"); iscomment=1;}
([a-z]|[0-9]|[A-Z]|" ")+  {if(iscomment==1) {cap(yytext);} else {printf("%s",yytext);}}
"\n" {printf("\n"); iscomment=0;}
"/*" {printf("/*"); isMLC=1;}
([a-z]|[0-9]|[A-Z]|" "|"\n")+  {if(isMLC==1) {cap(yytext);} else {printf("%s",yytext);}}
"*/" {printf("*/"); printf("\n"); isMLC=0;}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin = fopen("abc.txt","r");
	yylex();
	return 0;
}

void cap(char *s){
	int i;
	for(i=0;s[i]!='\0';i++)
		printf("%c",toupper(s[i]));
}