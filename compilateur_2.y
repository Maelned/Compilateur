%{
    int yydebug =0;
    #include <stdio.h>

    int yyerror(char *s)
    {
        fprintf(stderr, "%s\n", s);
    }

    %}

    #include "symboltable.h";


%token t_MAIN  t_VIRGULE  t_PRINTF  t_WHILE  t_FOR  t_IF  
t_INT  t_FLOAT  t_CHAR  t_CHIFFRE  t_PARENTHESE_OUVRANTE  t_PARENTHESE_FERMANTE  t_ACCOLADE_OUVRANTE   t_ACCOLADE_FERMANTE  
t_TAB  t_ADDITION  t_MULTIPLICATION  t_DIVISION_ENTIERE  t_MODULO  t_SOUSTRACTION  t_POINT  t_OU  t_ET_LOGIQUE  t_TEST_EGALITE  
t_INFERIEUR_OU_EGAL  t_SUPERIEUR_OU_EGAL  t_INFERIEUR  t_SUPERIEUR  t_EGAL   t_NEGATION  t_RETURN  
t_GUILLEMET  t_POINT_VIRGULE  t_VARIABLE

%right '='
%left '+'  '-'
%left '*'  '/'
%start S

%% 
S:  t_INT t_MAIN t_PARENTHESE_OUVRANTE t_PARENTHESE_FERMANTE t_ACCOLADE_OUVRANTE corps t_ACCOLADE_FERMANTE {printf("le début\n");}
    | t_MAIN t_PARENTHESE_OUVRANTE t_PARENTHESE_FERMANTE t_ACCOLADE_OUVRANTE corps t_ACCOLADE_FERMANTE {printf("le début\n");}
    ;
corps :     declaration instruction //{printf("le corps du prog\n");}
            ;
declaration :   type t_VARIABLE t_POINT_VIRGULE declaration
                | type t_VARIABLE t_VIRGULE declaration_type
                ;

declaration_type : t_VARIABLE t_VIRGULE declaration_type
                    | t_VARIABLE t_POINT_VIRGULE declaration
                    | t_VARIABLE t_POINT_VIRGULE

                ;

instruction :   affectation instruction {printf("affectation puis instruction\n");}
                | affectation
                | print instruction {printf("printf instruction\n");}
                | print  {printf("printf\n");}
                ;
                
affectation :   t_VARIABLE t_EGAL expression t_POINT_VIRGULE {printf("affectation\n");}
                
                ;

texte : t_VARIABLE texte 
        | t_VARIABLE
        ;

        
print : t_PRINTF t_PARENTHESE_OUVRANTE t_VARIABLE t_PARENTHESE_FERMANTE t_POINT_VIRGULE
        | t_PRINTF t_PARENTHESE_OUVRANTE t_GUILLEMET texte t_GUILLEMET t_VARIABLE t_ACCOLADE_FERMANTE t_POINT_VIRGULE

expression :    t_CHIFFRE {printf("chiffre\n");}
                |t_VARIABLE {printf("variable\n");}
                |t_PARENTHESE_OUVRANTE expression t_PARENTHESE_FERMANTE {printf("2e ex\n");}
                |expression operateur expression  {printf("expression\n");}
                ;


operateur : t_ADDITION 
            | t_MULTIPLICATION 
            | t_DIVISION_ENTIERE 
            | t_MODULO 
            | t_SOUSTRACTION
            ;
type :  t_INT 

        | t_FLOAT 
        | t_CHAR {printf("operateur\n");}
        ;

%%

int main(){ yyparse();}

