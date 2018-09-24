%{
  int countSLC=0,countMLC=0;	
%}

%%
"//"([a-z]|[0-9]|[A-Z]|" ")*    {countSLC++;}
"/*"([a-z]|[0-9]|[A-Z]|" "|"\n")+"*/"    {countMLC++;}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin = fopen("abc.txt","r");
	yyout = fopen("abcd.txt","w");
	yylex();
	printf("\nSingle Line comments = %d\n", countSLC);
	printf("\nMulti Line comments = %d\n", countMLC);
	return 0;
}