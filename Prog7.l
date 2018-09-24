%{
	int maxIndent=0;
	int c=0;
%}

%%
["\t"] {c++;}
["\n"] {
if(c>maxIndent) {maxIndent=c;}
c=0;
}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin=fopen("abc.txt","r");
	yyout=fopen("abcd.txt","w");
	yylex();
	printf("\nMaximum indentation is: %d",maxIndent);
	return 0;
}