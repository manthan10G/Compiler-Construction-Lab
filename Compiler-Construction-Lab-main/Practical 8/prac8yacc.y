%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%
stmt: expr '\n' { printf("Result: %d\n", $1); }
    ;

expr: NUMBER          { $$ = $1; }
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | expr '%' expr   { $$ = $1 % $3; }
    | expr '^' expr   { $$ = pow($1, $3); }
    ;
%%

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
