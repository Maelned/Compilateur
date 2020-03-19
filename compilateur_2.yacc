#include <stdlib.h>
#include <stdio.h>



%token t_MAIN  t_VIRGULE  t_PRINTF  t_WHILE  t_FOR  t_IF  
t_INT  t_FLOAT  t_CHAR  t_CHIFFRE  t_PARENTHESE_OUVRANTE  t_PARENTHESE_FERMANTE  t_ACCOLADE_OUVRANTE   t_ACCOLADE_FERMANTE  
t_TAB  t_ADDITION  t_MULTIPLICATION  t_DIVISION ENTIERE  t_MODULO  t_SOUSTRACTION  t_POINT  t_OU  t_ET_LOGIQUE  t_TEST_EGALITE  
t_INFERIEUR_OU_EGAL  t_SUPERIEUR_OU_EGAL  t_INFERIEUR  t_SUPERIEUR  t_EGAL   t_NEGATION  t_RETURN  
t_GUILLEMET  t_POINT_VIRGULE  t_VARIABLE     

%right '='
%left '+'  '-'
%left '*'  '/'

%% 
S: t_INT t_MAIN t_PARENTHESE_OUVRANTE t_PARENTHESE_FERMANTE t_ACCOLADE_OUVRANTE corps t_ACCOLADE_FERMANTE
corps : declaration instruction t_VIRGULE
declaration : type t_VARIABLE declaration_type
declaration_type :  t_VIRGULE t_VARIABLE declaration_type | t_POINT_VIRGULE 
instruction : affectation 
affectation : t_VARIABLE t_EGAL expression t_POINT_VIRGULE
expression : expression_tmp operateur expression_tmp
expression_tmp : t_VARIABLE|t_CHIFFRE|expression_tmp|expression

operateur : t_ADDITION | t_MULTIPLICATION | t_DIVISION ENTIERE | t_MODULO | t_SOUSTRACTION
type : t_INT | t_FLOAT | t_CHAR

%%
