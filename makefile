all: comp

comp: y.tab.o lex.yy.o
	gcc -c symboltable.c 
	gcc -Wall lex.yy.o y.tab.o symboltable.o -o comp

y.tab.c:compilateur_2.y
	yacc --verbose --debug compilateur_2.y

lex.yy.c: compilateur_2.l
	lex compilateur_2.l
