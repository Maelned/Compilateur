#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
#include <stdint.h>


struct struct_symbol
{
    int id;
    int constant;
    int init;
    int depth;
};

typedef struct struct_symbol type_symbol;

int add_symbol(const int, int, int);
int add_tmp_symbol(const int, int, int);
int get_address(const int, int);
int is_initialized(const int, int);
int is_constant(const int, int);
int get_last_pointer();
int get_end_pointer();
void pop_symbol();
void set_initialized(const int, int);

#endif