%{
	int a=0,s=0,m=0,d=0,o=0,c=0;
%}

%%
[a-zA-Z]+ {printf("%s is an identifier\n",yytext);}
[+] {a++;}
[-] {s++;}
[*] {m++;}
[/] {d++;}
[(] {o++;}
[)] {c++;}
%%

int yywrap() {return 1;}

int main(void)
{
	printf("Enter expression:\n");
	yylex();
	if(o==c)
	{
	   printf("Valid Expression\n");
	}
	else
	{
	   printf("Invalid Expression\n");
	}
	printf("ADD=%d\nSUB=%d\nMUL=%d\nDIV=%d\n",a,s,m,d);
	printf("Operators are: \n");
    if(a>0)
    printf("+\n");
    if(s>0)
    printf("-\n");
    if(m>0)
    printf("*\n");
    if(d>0)
    printf("/\n");
    return 0;
}