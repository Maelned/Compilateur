#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
#include <stdint.h>


struct struct_symbol
{
    char id[50];
    int constant;
    int init;
    int depth;
};

typedef struct struct_symbol type_symbol;

int add_symbol(char *, int, int);
int add_tmp_symbol(char *, int, int);
int get_address(char *, int);
int is_initialized(char *, int);
int is_constant(char *, int);
int get_last_pointer();
int get_end_pointer();
void clear_tmp_symbol(int);
void pop_symbol();
void set_initialized(char *, int);

#endif