#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
#include <stdint.h>

enum e_type
{
    S8BIT=1,
    S16BIT=2
};

struct struct_symbol
{
    uint8_t id[256];
    enum e_type mem_size;
    uint8_t initialized;
    uint8_t depth;
};

#endif