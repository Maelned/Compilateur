%{


#include "y.tab.h"



%}

%%

\t  ;
" " {};
"," return t_VIRGULE ;
"main" return t_MAIN ;
"printf" return t_PRINTF ;
"while" return t_WHILE ;
"for" return t_FOR ;
"if" return t_IF ;
int return t_INT ;
float return t_FLOAT ;
char return t_CHAR ;
[0-9]+ return t_CHIFFRE ;
"\n"+ ;
"\b"+ ;
"(" return t_PARENTHESE_OUVRANTE ;
")" return t_PARENTHESE_FERMANTE ;
"{" return t_ACCOLADE_OUVRANTE ; 
"}" return t_ACCOLADE_FERMANTE ;
"["[0-9]+"]" return t_TAB ;
"+" return t_ADDITION ;
"*" return t_MULTIPLICATION ;
"/" return t_DIVISION_ENTIERE ;
"%" return t_MODULO ;
"-" return t_SOUSTRACTION ;
"." return t_POINT ;
"|" return t_OU ;
"&" return t_ET_LOGIQUE ;
"==" return t_TEST_EGALITE ;
"<=" return t_INFERIEUR_OU_EGAL ;
">=" return t_SUPERIEUR_OU_EGAL ;
"<" return t_INFERIEUR ;
">" return t_SUPERIEUR ;
"=" return t_EGAL ; 
"!" return t_NEGATION ;
return return t_RETURN ;
\" return t_GUILLEMET ;
";" return t_POINT_VIRGULE ;
[a-zA-Z][a-zA-Z0-9"_""-"]* return t_VARIABLE ;


%%
int yywrap(void){}



