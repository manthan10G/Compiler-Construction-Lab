%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER

%%
input:
| input stmt
;

stmt:
expr '\n' {printf("Result: %d\n", $1);}
| error '\n' {printf("Invalid expression\n"); yyerrok;}
;

expr:
NUMBER {$$ = $1;}
| expr expr '+' {$$ = $1 + $2;}
| expr expr '-' {$$ = $1 - $2;}
| expr expr '*' {$$ = $1 * $2;}
| expr expr '/' {
    if($2 == 0){
        printf("Division by zero\n");
        YYERROR;
    }
    $$ = $1 / $2;
}
| expr expr '%' {
    if($2 == 0){
        printf("Modulo by zero\n");
        YYERROR;
    }
    $$ = $1 % $2;
}
;

%%

void yyerror(char *s){
    printf("Error\n");
}

int main(){
    yyparse();
    return 0;
}
