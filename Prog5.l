
%{
%}

%%
[aeiouAEIOU].[a-zA-Z0-9.]+    printf("");
[a-zA-Z0-9]+    printf("%s",yytext);
%%

int yywrap() {return 1;}

int main(void)
{
    yyin=fopen("abc.txt","r");
    yylex();
    return 0;
}