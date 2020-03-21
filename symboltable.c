#include "symboltable.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define SIZE_TAB 100

struct struct_table
{
    int pointer;
    table_symbol entries[SIZE_TAB];
};

typedef struct struct_table type_table;

type_table stack = {0};


// add the symbol to the table with id, depth and whether it is a constant or not
int add_symbol(const uint16_t id, int cons, uint16_t depth)
{
    type_symbol * new_symbol = &(stack.entries[stack.pointer]);
    strcpy(new_symbol->id, id);
    new_symbol->constant = cons;
    new_symbol->initialized = 0;
    new_symbol->depth = depth;

    stack.pointer++;

    return stack.pointer - 1;
}

// return the address of the symbol (id)
int get_address(const uint16_t id, uint16_t depth)
{
    for(int i=0; i<stack.pointer; i++)
    {
        type_symbol *current_symbol = &(stack.entries[i]);
        if(current_symbol->depth == depth)
            if(!strcmp(current_symbol->id, id))
                return i;
    }

    /* inexistent symbol */
    exit(-2);  
}

// check whether the symbol is initialized
int is_initialized(const uint16_t* id, uint16_t depth)
{
    int addr = get_address(id, depth);
    return stack.entries[addr].init;
}
// check whether the symbol is a constant
int is_constant(const uint16_t* id, uint16_t depth)
{
    int addr = get_address(id, depth);
    return stack.entries[addr].constant;
}

// check whether the symbol is a constant
int get_last_pointer(){
    return stack.pointer-1;
}

void set_initialized(const uint16_t* id, uint16_t depth)
{
    int addr = get_address(id, depth);
    stack.entries[addr].init = 1;
}

void pop_symbol(){
    stack.pointer--;
}