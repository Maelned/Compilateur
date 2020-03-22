%{


#include "y.tab.h"



%}
CONST const
TYPE_INT int
TYPE_VOID void

AFFEC \=
COMPAR \=\=
NCOMPAR \!\=
INF "<"
INF_E "<="
SUP ">"
SUP_E ">="

AO \{
AF \}
PO \(
PF \)
CO \[
CF \]

INT [0-9]+
CHAR \'.\'
STRING \".*\"
MAIN main
VAR [a-zA-Z][a-zA-Z0-9_]*
IF if
ELSE else
VIRG \,
PV \;

OP_ADD \+
OP_DIFF \-
OP_MUL \*
OP_DIV \/

SPC [\t ]*
TAB "\t"+
EOF "\n"
RETURN return
PRINT printf


%%
{CONST} return t_TCONST;
{TYPE_INT} return t_TINT;
{TYPE_VOID} return t_VOID;

{AFFEC} return t_AFFEC; 
{COMPAR} return t_COMPAR ;
{NCOMPAR} return t_NCOMPAR;
{INF} return t_INF;
{INF_E} return t_INF_E;
{SUP} return t_SUP;
{SUP_E} return t_SUP_E;


{CHAR} return t_CHAR;
{INT} return t_INT;
{STRING} return t_STRING;
{MAIN} return t_MAIN;
{VAR} return t_VAR;
{PRINTF} return t_PRINTF;
{IF} return t_IF;
{ELSE} return t_ELSE;
{PV} return t_PV;
{VIRG} return t_VIRG;
{SPC} ;
{TAB} ;
{EOF} ;


"\b"+ ;

{PO} return t_PO;
{PF} return t_PF;
{AO} return t_AO; 
{AF} return t_AF;
{CO} return t_CO;
{CF} return t_CF;


{OP_ADD} return t_ADD ;
{OP_MUL} return t_MUL ;
{OP_DIV} return t_DIV ;
{OP_DIFF} return t_DIFF ;
{RETURN} return t_RETURN ;


%%
int yywrap(void){}



