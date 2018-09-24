%{
%}

%%
[^(a-z)|^(A-Z)|^(0-9)] {}
%%

int yywrap() {}

int main(void)
{
	yyin=fopen("abc.txt","r");
	yylex();
	return 0;
}