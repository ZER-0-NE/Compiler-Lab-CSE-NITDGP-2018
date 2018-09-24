%{
%}

%%
if|else|while|int|switch|for|char|return|void|printf|scanf {printf("%s",yytext);}
[a-z] { printf("%c",yytext[0]-32);}
%%

int yywrap() {}

int main(void)
{
	yyin=fopen("abc.txt","r");
    yylex();
    return 0;
}
