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
        printf("mem[%d] = %08x\n", i, mem[i]);
    }
}

// Escreve um byte na memória
void sb(uint32_t address, int16_t kte, int8_t dado)
{
    uint32_t mask;

    switch (kte) {
        case 0: mask = 0xFFFFFF00; break;
        case 1: mask = 0xFFFF00FF; break;
        case 2: mask = 0xFF00FFFF; break;
        case 3: mask = 0x00FFFFFF; break;
    }

    mem[address/4] = (mem[address/4] & mask) | dado << (kte*8);
}

// Escreve uma half word na memória
void sh(uint32_t address, int16_t kte, int16_t dado)
{
    uint32_t mask;

    switch (kte) {
        case 0: mask = 0xFFFF0000; break;
        case 1: mask = 0x00FFFF00; break;
        case 2: mask = 0x0000FFFF; break;
    }

    mem[address/4] = (mem[address/4] & mask) | dado << (kte*8);
}

// lê um byte - retorna inteiro com sinal
int32_t lb(uint32_t address, int16_t kte)
{
    int32_t d = (mem[address/4] >> (kte*8)) & 0xFF;
    printf("%02x", d);
    return d;
}

// Lê uma half word - retorna um inteiro com sinal.
int32_t lh(uint32_t address, int16_t kte)
{
    int32_t d = (mem[address/4] >> (kte*16)) & 0xFFFF;
    printf("%04x", d);
    return d;
}

#endif /* end of include guard: MIPS_H */
