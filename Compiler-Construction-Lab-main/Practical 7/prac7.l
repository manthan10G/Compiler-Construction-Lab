%{
#include <stdio.h>
%}

%%
^.*com$    { printf("Valid String"); }
.*         { printf("Invalid String"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a text line:");
    yylex();
    return 0;
}
