%{ #include<stdio.h>
int c=0;
%}

%%
[a-zA-Z]+ {
if(yyleng>10)
{ c++;
}
}
%%
int yywrap() {}
int main(void)
{
 yyin=fopen("abc.txt","r");
 yylex(); 
 printf("Number of words greater than 10 are : %d",c);
 printf("\n");
 return 0;
}
 
