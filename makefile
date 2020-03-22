all: comp

comp: y.tab.o lex.yy.o
	gcc -Wall lex.yy.o y.tab.o -o comp

y.tab.c:compilateur_2.y
	yacc --verbose --debug -d compilateur_2.y

lex.yy.c: compilateur_2.l
	lex compilateur_2.l
