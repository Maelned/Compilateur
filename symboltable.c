#include "symboltable.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define SIZE_TAB 256

struct struct_table
{
    int pointer;
    type_symbol entries[SIZE_TAB];
};

typedef struct struct_table type_table;

type_table stack = {0};
int end_pointer_stack = SIZE_TAB - 1;

// add the symbol to the table with id, depth and whether it is a constant or not
int add_symbol(char * id, int cons, int depth)
{
    printf("ajout symbole");
    type_symbol * new_symbol = &(stack.entries[stack.pointer]);
    strcpy(new_symbol->id, id);
    new_symbol->constant = cons;
    new_symbol->init = 0;
    new_symbol->depth = depth;
    printf("ajout symbole");
    stack.pointer++;

    return stack.pointer - 1;
}

int add_tmp_symbol(char * id, int cons, int depth)
{
    type_symbol * new_symbol = &(stack.entries[end_pointer_stack]);
    
    strcpy(new_symbol->id, id);
    new_symbol->constant = cons;
    new_symbol->init = 0;
    new_symbol->depth = depth;
    end_pointer_stack--;

    return stack.pointer - 1;
}

// return the address of the symbol (id)
int get_address(char * id, int depth)
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
int is_initialized(char * id, int depth)
{
    int addr = get_address(id, depth);
    return stack.entries[addr].init;
}
// check whether the symbol is a constant
int is_constant(char * id, int depth)
{
    int addr = get_address(id, depth);
    return stack.entries[addr].constant;
}

void clear_tmp_symbol(int nb_tmp_symbol){
    end_pointer_stack = end_pointer_stack + nb_tmp_symbol;
}


// check whether the symbol is a constant
int get_last_pointer(){
    return stack.pointer-1;
}

int get_end_pointer(){
    return end_pointer_stack;
}

void set_initialized(char * id, int depth)
{
    int addr = get_address(id, depth);
    stack.entries[addr].init = 1;
}

void pop_symbol(){
    stack.pointer--;
}