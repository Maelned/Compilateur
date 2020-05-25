all: comp

comp: y.tab.o lex.yy.o symboltable.o asm.o
	gcc -Wall lex.yy.o y.tab.o symboltable.o asm.o -o comp

symboltable.o: symboltable.c
	gcc -c symboltable.c

asm.o: asm.c
	gcc -c asm.c

y.tab.c: compilateur_2.y
	yacc --verbose --debug -d compilateur_2.y

lex.yy.c: compilateur_2.l
	lex compilateur_2.l
