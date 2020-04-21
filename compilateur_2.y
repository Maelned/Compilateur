%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "symboltable.h"
    #include "asm.h"

    int yydebug =0;
    int depth = 0;
    int constante = 0;
    int cpt_tmp_symbol = 0;
    char Buffer[50];


   
    void clean_file(){
        FILE * fichier = fopen("./assembly.txt","w");
        fputs("",fichier);
        fclose(fichier);
    }

    void insert_file(char * code_assembleur){
        FILE * fichier = fopen("./assembly.txt","a");
        
        if(fichier != NULL){
            fputs(code_assembleur, fichier);
            fclose(fichier);
        }
        else{
        }
    
    }
    int yyerror(char *s)
    {
        fprintf(stderr, "%s\n", s);
    }
    void affectation(char * var,int addr_tmp){
        int var_addr  = get_address(var, depth);
        char * assembly = malloc(100 * sizeof(char));
        sprintf(assembly,"COP @%d @%d\n",var_addr,addr_tmp);
        
        insert_file(assembly);
        add_asm("COP",var_addr,addr_tmp,-1);

        set_initialized(var, depth);
    }

    int tmp_affec(int nb){
        cpt_tmp_symbol++; 
        sprintf(Buffer,"%d",get_end_pointer());
        int tmp_addr = add_tmp_symbol(Buffer,constante,depth);
        char * assembly = malloc(100 * sizeof(char));
        sprintf(assembly,"AFC @%d %d\n",tmp_addr,nb);
        insert_file(assembly);
        add_asm("AFC",tmp_addr,nb,-1);
        return tmp_addr;
    }

    int operation(int addr1,char * op,int addr2){
        sprintf(Buffer,"%d",get_end_pointer());
        int addr_return = add_tmp_symbol(Buffer,constante,depth);
        printf("%s @ret : %d @exp1 : %d @exp2 : %d\n",op,addr_return,addr1,addr2);

        char * assembly = malloc(100 * sizeof(char));
        sprintf(assembly,"%s @%d @%d @%d\n",op,addr_return,addr1,addr2);

        insert_file(assembly);
        add_asm(op,addr_return,addr1,addr2);
        return addr_return;
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
    char * var;

};

/* Déclarations de types */
/*  |t_PO expression  
            {
                int a ddr_tmp = tmp_affec($2);
                cpt_tmp_symbol++; 
                $$ = addr_tmp;
            }
            t_PF*/

%type <entier> t_INT;
%type <entier> expression;
%type <entier> ifblock;
%type <entier> ifblock1;
%type <entier> whileblock;
%type <entier> t_WHILE;
%type <entier> t_IF;
%type <entier> t_ELSE;
%type <var> t_VAR;



%right '='
%left '+'  '-'
%left '*'  '/'
%start S

%% 
S:  {clean_file();}type t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--; print_assembly();}
    | t_MAIN t_PO t_PF t_AO {depth++;} corps t_AF {depth--;}
    ;
corps:     declaration instruction
        ;

declaration:   type t_VAR {add_symbol($2,constante,depth);} declaration_type
                ;

declaration_type: t_VIRG t_VAR {add_symbol($2,constante,depth);} declaration_type
                    | t_PV declaration 
                    | t_PV
                ;

instruction:   affectation instruction {printf("affectation puis instruction\n");}
                | affectation
                | fonction
                | fonction instruction
                ;
                
affectation:   t_VAR t_AFFEC expression 
                {
                    affectation($1,$3);
                    clear_tmp_symbol(cpt_tmp_symbol);
                    cpt_tmp_symbol = 0;
                } 
                t_PV 
                ;


ifblock:
    ifblock1
        {patch_JMF($1, get_nb_line_asm()); // on veut que JMF saute ici, la fin de if-(sans else)
        }
    | ifblock1 t_ELSE
        {$2 = add_asm("JMP", -1, -1, -1);                     // la fin de if, on veut sauter à la fin de else (ligneY)
        patch_JMF($1, get_nb_line_asm()+1);  // ligneX, le début de else, on veut que JMF saute ici.
        }
    t_AO instruction t_AF
        {patch_JMP($2, get_nb_line_asm()+1); // ligneY, la fin de else
        }
    ;

ifblock1:
    t_IF t_PO expression
        {$1 = add_asm("JMF", $3,-1, -1);     // on renvoie la ligne JMF; on veut sauter à la fin de if (ligneX)
        }
    t_PF t_AO corps t_AF
        {$$ = $1; // on ne peut qu’affecter $$ à la fin d'une règle
        }
    ;

whileblock: t_WHILE t_PO expression 
                {$1 = add_asm("JMF", $3,-1, -1);     // on renvoie la ligne JMF; on veut sauter à la fin de if (ligneX)
                }
            t_PF t_AO corps t_AF
                {$$ = $1; // on ne peut qu’affecter $$ à la fin d'une règle
                }
            ;
fonction:   printblock
            |whileblock
            |ifblock 
            ;

printblock:  t_PRINTF t_PO t_VAR t_PF t_PV
        | t_PRINTF t_PO t_STRING t_PF t_PV
        ;

expression: t_INT
            {   
                int addr_tmp = tmp_affec($1);
                $$ = addr_tmp;
            }

            |t_VAR {$$ = get_address($1,depth);}

            

            |expression t_ADD expression
                {
                    $$ = operation($1,"ADD",$3);
                }

            |expression t_MUL expression 
                {
                    $$ = operation($1,"MUL",$3);
                }

            |expression t_DIV expression
                {
                    $$ = operation($1,"DIV",$3);
                } 

            |expression t_DIFF expression 
                {
                    $$ = operation($1,"DIFF",$3);
                }
            |expression t_INF expression 
                {
                    $$ = operation($1,"INF",$3);
                }

            |expression t_SUP expression 
                {
                    $$ = operation($1,"SUP",$3);
                }
            |expression t_COMPAR expression 
                {
                    $$ = operation($1,"EQU",$3);
                }
            ;

type:   t_TINT   {constante = 0;} 
        |  t_TCONST {constante = 1;} 
        |  t_TVOID  {constante = 0;}
        ;

%%

int main(){ yyparse();}

