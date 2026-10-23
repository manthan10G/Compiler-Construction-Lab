%{
#include<stdio.h>
#include<string.h>

char changeCase(char c){
}
%}

%%
[A-Za-z] {putchar(changeCase(yytext[0]));}
. {putchar(yytext[0]);}
\n {} 
%%

int main() {
	int c;
   	while ((c = yylex()) != 0)
   	{
		if (c >= 'a' && c <= 'z')
			putchar(c - 'a' + 'A');
		else if (c >= 'A' && c <= 'Z')
                	putchar(c - 'A' + 'a');
        	else
            		putchar(c);
    }
    return 0;
}

int yywrap() {
    return 1;
}
