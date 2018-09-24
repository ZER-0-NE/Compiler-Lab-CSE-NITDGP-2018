%{
	int count=0;
%}

%%
(a|A)[a-zA-Z]*(w|W) {count++;}
%%

int yywrap() {return 1;}

int main(void)
{
	yyin = fopen("abc.txt","r");
	yyout = fopen("abcd.txt","w");
	yylex();
	printf("Count is: %d\n",count);
	return 0;
}