#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H



struct struct_symbol
{
    uint16_t id;
    int constant;
    int init;
    uint16_t depth;
};

typedef struct struct_symbol type_symbol;

int add_symbol(const uint16_t*, int, uint16_t);
int get_address(const uint16_t, uint8_t);
int is_initialized(const uint8_t, uint8_t);
int is_constant(const uint16_t, uint16_t);
int get_last_pointer();
void pop_symbol();
void set_initialized(const uint8_t*, uint8_t);

#endif