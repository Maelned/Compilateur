%{
#include "y.tab.h"

%}

%%

[\t ]* ;
"\n" ;
"\b"+ ;

const {return t_TCONST;}
int return t_TINT;
void return t_TVOID;

\= return t_AFFEC; 
\=\= return t_COMPAR ;
\!\= return t_NCOMPAR;
\< return t_INF;
\<\= return t_INF_E;
\> return t_SUP;
\>\= return t_SUP_E;
\'.\' return t_CHAR;
[0-9]+ {strcpy(yylval.entier, atof(yytext)); return t_INT;}
\".*\" return t_STRING;
main return t_MAIN;
printf return t_PRINTF;
if return t_IF;
else return t_ELSE;
return return t_RETURN ;
[a-zA-Z][a-zA-Z0-9_]* strcpy(yylval.identifier, yytext); return t_VAR;

\; return t_PV;
\, return t_VIRG;

\( return t_PO;
\) return t_PF;
\{ return t_AO; 
\} return t_AF;
\[ return t_CO;
\] return t_CF;


\+ return t_ADD ;
\* return t_MUL ;
\/ return t_DIV ;
\- return t_DIFF ;


%%

int yywrap(void){}


