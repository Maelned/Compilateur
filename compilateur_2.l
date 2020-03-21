%{


#include "y.tab.h"



%}
CONST const
TYPE_INT int
TYPE_VOID void
VAR [a-zA-Z][a-zA-Z0-9_]*
AFFEC \=
COMPAR \=\=
NCOMPAR \!\=
AO \{
AF \}
PO \(
PF \)

OP_ADD \+
OP_DIFF \-
OP_MUL \*
OP_DIV \/
PV \;
PRINT printf


%%
{TYPE_INT} return t_INT;
{CONST} return t_CONST;
{TYPE_VOID} return t_VOID;
\t  ;
" " {};
"," return t_VIRGULE ;
"main" return t_MAIN ;
"printf" return t_PRINTF ;
"while" return t_WHILE ;
"for" return t_FOR ;
"if" return t_IF ;
float return t_FLOAT ;
char return t_CHAR ;
[0-9]+ return t_CHIFFRE ;
"\n"+ ;
"\b"+ ;
{PO} return t_PO ;
{PF} return t_PF ;
{AO} return t_AO; 
{AF} return t_AF;
"["[0-9]+"]" return t_TAB ;
{OP_ADD} return t_ADD ;
{OP_MUL} return t_MUL ;
{OP_DIV} return t_DIV ;
{OP_DIFF} return t_DIFF ;
"." return t_POINT ;
"|" return t_OU ;
"&" return t_ET_LOGIQUE ;
{COMPAR} return t_COMPAR ;
{NCOMPAR} return t_NCOMPAR;
"<=" return t_INFERIEUR_OU_EGAL ;
">=" return t_SUPERIEUR_OU_EGAL ;
"<" return t_INFERIEUR ;
">" return t_SUPERIEUR ;
{AFEC} return t_EGAL ; 
"!" return t_NEGATION ;
"return" return t_RETURN ;
\" return t_GUILLEMET ;
{PV} return t_PV ;
{VAR} return t_VAR ;


%%
int yywrap(void){}



