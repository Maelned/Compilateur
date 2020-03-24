%{
    int yydebug =0;
    int depth = 0;
    int constante = 0;
    #include <stdio.h>
    #include "symboltable.h"
    int yyerror(char *s)
    {
        fprintf(stderr, "%s\n", s);
    }
    void affectation(char *var){
     printf("affectation de %s par une expr\n", ident);
    int last_adr = get_last_pointer();
    int var_adr  = get_address(var, depth);
    save_line("READ R1, %d", adr_last);
    save_line("SAVE R1, %d", adr_var);

    set_initialized(adr_last, scope_depth);
    }

%}

   


%token t_MAIN  t_VIRG  t_PRINTF  t_WHILE  t_IF  t_ELSE t_TINT  t_TVOID
t_INT  t_FLOAT  t_CHAR  t_PO  t_PF  t_AO   t_AF t_CO t_CF
t_TAB  t_ADD  t_MUL  t_DIV t_DIFF t_COMPAR t_NCOMPAR  
t_INF_E  t_SUP_E  t_INF  t_SUP  t_AFFEC    t_RETURN  
t_GUILLEMET  t_PV  t_VAR t_STRING t_TCONST


%union { 
    int integer;
    char identifier[256];

};

/* Déclarations de types */
%type <integer> t_INT;
%type <identifier> t_VAR;



%right '='
%left '+'  '-'
%left '*'  '/'
%start S

%% 
S:  type t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--;}
    | t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--;}
    ;
corps :     declaration instruction //{printf("le corps du prog\n");}
            ;
declaration :   type t_VAR {add_symbol($2,constante,depth)} declaration_type 
                ;

declaration_type : t_VIRG t_VAR {add_symbol($2,constante,depth)} declaration_type
                    | t_PV declaration
                    | t_PV
                ;

instruction :   affectation instruction {printf("affectation puis instruction\n");}
                | affectation
                | print instruction {printf("printf instruction\n");}
                | print  {printf("printf\n");}
                | si
                ;
                
affectation :   t_VAR t_AFFEC expression t_PV {printf("affectation\n");}
                
                ;


si : t_IF t_PO cond t_PF t_AO {depth++;} corps t_AF {depth--;}

cond :  expression comparateur expression 
        | expression

        
print : t_PRINTF t_PO t_VAR t_PF t_PV
        | t_PRINTF t_PO t_STRING t_PF t_PV

expression :    t_INT {printf("INT\n");}
                |t_VAR {printf("VAR\n");}
                |t_PO expression t_PF {printf("2e ex\n");}
                |expression operateur expression  {printf("expression\n");}
                ;


operateur : t_ADD 
            | t_MUL 
            | t_DIV 
            | t_DIFF
            ;

comparateur : t_COMPAR
            | t_NCOMPAR
            | t_INF
            | t_INF_E
            | t_SUP
            | t_SUP_E
            | t_AFFEC
            ;

type :     t_TINT   {constante = 0;} 
        |  t_TCONST {constante = 1;} 
        |  t_TVOID  {constante = 0;}
        ;

%%

int main(){ yyparse();}

