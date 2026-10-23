%{
#include <stdio.h>

int w = 0, kw = 0, id = 0;
int spaces = 0, lines = 0, comments = 0;
%}

%%
"//".* 	{comments++; }
"int"|"float"|"char"|"double"|"if"|"else"|"while"|"do"|"for"|"return"  {kw++; w++; }
[A-Za-z_][A-Za-z0-9_]*  {id++; w++; }
[0-9]+(\.[0-9]+)?  {w++; }
[ \t]  {spaces++; }
\n  {lines++; }
.  { }
%%

int main()
{
    printf("Enter the input:\n");
    yylex();

    printf("\nTotal Words = %d", w);
    printf("\nTotal Keywords = %d", kw);
    printf("\nTotal Identifiers = %d", id);
    printf("\nTotal Spaces = %d", spaces);
    printf("\nTotal Lines = %d", lines + 1);
    printf("\nTotal Comments = %d\n", comments);

    return 0;
}

int yywrap()
{
    return 1;
}
