#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
#include <stdint.h>


struct struct_symbol
{
    uint16_t id;
    int constant;
    int init;
    uint16_t depth;
};

typedef struct struct_symbol type_symbol;

int add_symbol(const uint16_t, int, uint16_t);
int get_address(const uint16_t, uint16_t);
int is_initialized(const uint16_t, uint16_t);
int is_constant(const uint16_t, uint16_t);
int get_last_pointer();
void pop_symbol();
void set_initialized(const uint16_t, uint16_t);

#endif