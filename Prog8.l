%{
#include<stdio.h>
int count=0;
%}

op [+-*/]
letter [a-zA-Z]
digit [0-9]

id {letter}*|({letter}{digit})+
notid ({digit}{letter})+

%%
[\t\n]+
if|else|while|int|switch|for|char|return|void|printf|scanf {}
{id} {printf("%s is an identifier\n", yytext); count++;}
{notid} {}
%%
int yywrap() {return 1;}

int main()
{
yyin=fopen("abc.txt","r");
yylex();
printf("Total identifiers are: %d\n", count);
return 0;
}