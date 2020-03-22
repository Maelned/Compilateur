%{
    int yydebug =0;
    #include <stdio.h>

    int yyerror(char *s)
    {
        fprintf(stderr, "%s\n", s);
    }

    %}

    #include "symboltable.h";


%token t_MAIN  t_VIRG  t_PRINTF  t_WHILE  t_FOR  t_IF  
t_INT  t_FLOAT  t_CHAR  t_INT  t_PO  t_PF  t_AO   t_AF  
t_TAB  t_ADD  t_MUL  t_DIV  t_MODULO  t_DIFF  t_POINT  t_OU  t_ET_LOGIQUE  t_TEST_EGALITE  
t_INFERIEUR_OU_EGAL  t_SUPERIEUR_OU_EGAL  t_INFERIEUR  t_SUPERIEUR  t_EGAL   t_NEGATION  t_RETURN  
t_GUILLEMET  t_PV  t_VAR

%right '='
%left '+'  '-'
%left '*'  '/'
%start S

%% 
S:  t_INT t_MAIN t_PO t_PF t_AO corps t_AF {printf("le début\n");}
    | t_MAIN t_PO t_PF t_AO corps t_AF {printf("le début\n");}
    ;
corps :     declaration instruction //{printf("le corps du prog\n");}
            ;
declaration :   type t_VAR t_PV declaration
                | type t_VAR t_VIRGULE declaration_type
                ;

declaration_type : t_VAR t_VIRGULE declaration_type
                    | t_VAR t_PV declaration
                    | t_VAR t_PV

                ;

instruction :   affectation instruction {printf("affectation puis instruction\n");}
                | affectation
                | print instruction {printf("printf instruction\n");}
                | print  {printf("printf\n");}
                ;
                
affectation :   t_VAR t_EGAL expression t_PV {printf("affectation\n");}
                
                ;

texte : t_VAR texte 
        | t_VAR
        ;

        
print : t_PRINTF t_PO t_VAR t_PF t_PV
        | t_PRINTF t_PO t_GUILLEMET texte t_GUILLEMET t_VAR t_AF t_PV

expression :    t_INT {printf("INT\n");}
                |t_VAR {printf("VAR\n");}
                |t_PO expression t_PF {printf("2e ex\n");}
                |expression operateur expression  {printf("expression\n");}
                ;


operateur : t_ADD 
            | t_MUL 
            | t_DIV 
            | t_MODULO 
            | t_DIFF
            ;
type :  t_INT 

        | t_FLOAT 
        | t_CHAR {printf("operateur\n");}
        ;

%%

int main(){ yyparse();}

