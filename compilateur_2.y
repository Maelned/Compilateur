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
%token t_MAIN  
%token t_VIRG  
%token t_PRINTF  
%token t_WHILE  
%token t_IF  
%token t_ELSE 
%token t_TINT  
%token t_TVOID
%token t_INT  
%token t_FLOAT  
%token t_CHAR  
%token t_PO  
%token t_PF  
%token t_AO   
%token t_AF 
%token t_CO 
%token t_CF
%token t_TAB  
%token t_ADD  
%token t_MUL  
%token t_DIV 
%token t_DIFF 
%token t_COMPAR 
%token t_NCOMPAR  
%token t_INF_E  
%token t_SUP_E  
%token t_INF 
%token t_SUP 
%token t_AFFEC  
%token t_RETURN  
%token t_GUILLEMET  
%token t_PV
%token t_VAR 
%token t_STRING 
%token t_TCONST

%union { 
    int entier;
    char var[256];

};

/* Déclarations de types */
%type <entier> t_INT;
%type <entier> expression;
%type <id> t_VAR;



%right '='
%left '+'  '-'
%left '*'  '/'
%start S

%% 
S:  type t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--;}
    | t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--;}
    ;
corps:     declaration instruction //{printf("le corps du prog\n");}
            ;

declaration:   type t_VAR {add_symbol($2,constante,depth)} declaration_type 
                ;

declaration_type: t_VIRG t_VAR {add_symbol($2,constante,depth)} declaration_type
                    | t_PV declaration
                    | t_PV



instruction:   affectation instruction {printf("affectation puis instruction\n");}
                | affectation
                | print instruction {printf("printf instruction\n");}
                | print  {printf("printf\n");}
                | si
                ;
                
affectation:   t_VAR t_AFFEC expression t_PV {printf("affectation\n");}
                
                ;


si : t_IF t_PO cond t_PF t_AO {depth++;} corps t_AF {depth--;}


cond:  expression comparateur expression 
        | expression
        ;

        
print:  t_PRINTF t_PO t_VAR t_PF t_PV
        | t_PRINTF t_PO t_STRING t_PF t_PV
        ;

expression: t_INT {printf("INT\n");}
            |t_VAR {printf("VAR\n");}
            |t_PO expression t_PF {printf("2e ex\n");}
            |expression operateur expression  {printf("expression\n");}
            ;

operateur:  t_ADD 
            | t_MUL 
            | t_DIV 
            | t_DIFF
            ;

comparateur: t_COMPAR
            | t_NCOMPAR
            | t_INF
            | t_INF_E
            | t_SUP
            | t_SUP_E
            | t_AFFEC
            ;
type:   t_TINT   {constante = 0;} 
        |  t_TCONST {constante = 1;} 
        |  t_TVOID  {constante = 0;}
        ;

%%

int main(){ yyparse();}

