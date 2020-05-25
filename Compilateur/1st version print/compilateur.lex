%%

[ \t]+ printf(" ESPACE ");
"," printf("VIRGULE ");
"main" printf("MAIN ");
"printf" printf("PRINTF ");
"while" printf("WHILE ");
"for" printf("FOR ");
"if" printf("IF ");
int printf("INT ");
float printf("FLOAT ");
char printf("CHAR ");
[0-9]+ printf("CHIFFRE ");
[\n]+ printf("NEWLINE\n");
[\b]+ printf("BACKSPACE ");
"(" printf("PARENTHESE_OUVRANTE ");
")" printf("PARENTHESE_FERMANTE ");
"{" printf("ACCOLADE_OUVRANTE "); 
"}" printf("ACCOLADE_FERMANTE ");
"["[0-9]+"]" printf("TAB ");
"+" printf("ADDITION ");
"*" printf("MULTIPLICATION ");
"/" printf("DIVISION ENTIERE ");
"%" printf("MODULO ");
"-" printf("SOUSTRACTION ");
"." printf("POINT ");
"|" printf("OU ");
"&" printf("ET_LOGIQUE ");
"==" printf("TEST D'EGALITE ");
"<=" printf("INFERIEUR_OU_EGAL ");
">=" printf("SUPERIEUR_OU_EGAL ");
"<" printf("INFERIEUR ");
">" printf("SUPERIEUR ");
"=" printf("EGAL "); 
"!" printf("NEGATION ");
return printf("RETURN ");
\" printf("GUILLEMET ");
";" printf("POINT_VIRGULE ");
[a-zA-Z][a-zA-Z0-9"_""-"]* printf("VARIABLE ");




%%
int yywrap(void){}

int main(void){
    printf("début \n");
    yylex();
    return 0;
}