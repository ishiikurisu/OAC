#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MEM_SIZE 4096
int32_t mem[MEM_SIZE];

// Imprime o conteúdo da memória no formato hexa, palavra por palavra.
void dump_mem(uint32_t add, uint32_t size)
{
    int i = 0;
    int limit = add+size/4;

    if (limit > MEM_SIZE) {
        limit = MEM_SIZE;
    }

    for (i = add; i < limit; ++i)
    {
        printf("mem[%d] = %x\n", i, mem[i]);
    }
}

#endif /* end of include guard: MIPS_H */
