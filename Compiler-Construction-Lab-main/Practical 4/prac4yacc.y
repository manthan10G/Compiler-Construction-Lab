%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(char*S);
%}

%token NUM
%token ID

%%

E:E'+'T|E'-'T|T;
T:T'*'F|T'/'F|F;
F:'('E')'|NUM|ID;
%%

int yyerror(char*S){
	printf("INVALID EXPRESSION!!!\n");
	exit (0);
	}
	
int main(){
	printf("Enter an expression: ");
	yyparse();
	printf("VALID EXPRESSION.\n");
	return 0;

}
