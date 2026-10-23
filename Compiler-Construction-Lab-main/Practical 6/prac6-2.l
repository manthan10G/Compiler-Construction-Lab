%{
#include <stdio.h>

void hexToDecimal(char a[])
{
    int i, n = 0, r;

    for (i = 0; a[i] != '\0'; i++)
    {
        if (a[i] >= '0' && a[i] <= '9')
            r = a[i] - '0';
        else if (a[i] >= 'A' && a[i] <= 'F')
            r = a[i] - 'A' + 10;
        else if (a[i] >= 'a' && a[i] <= 'f')
            r = a[i] - 'a' + 10;

        n = n * 16 + r;
    }

    printf("Decimal: %d", n);
}
%}

%%
[0-9A-Fa-f]+    { hexToDecimal(yytext); }
\n              ;
%%

int main()
{
    printf("Enter a Hexadecimal Number: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
