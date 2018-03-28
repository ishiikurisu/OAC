#include <stdio.h>
#include "./mips.h"

int main(int argc, char const *argv[]) {
    int i;

    for (i = 0; i < MEM_SIZE; ++i)
    {
        mem[i] = 0x0;
    }

    printf("# Trabalho 1 de OAC 2018/1");
    printf("Guardando dados na memória:\n");
    // sb(0, 0, 0x04); sb(0, 1, 0x03); sb(0, 2, 0x02); sb(0, 3, 0x01);
    // sb(4, 0, 0xFF); sb(4, 1, 0xFE); sb(4, 2, 0xFD); sb(4, 3, 0xFC);
    // sh(8, 0, 0xFFF0); sh(8, 2, 0x8C);
    // sw(12, 0, 0xFF);
    // sw(16, 0, 0xFFFF);
    // sw(20, 0, 0xFFFFFFFF);
    // sw(24, 0, 0x80000000);
    printf("\n");
    printf("Lendo dados da memória:\n");
    dump_mem(0, 28);
    // lb(0,0), lb(0,1), lb(0,2) lb(0,3) // imprimir em hexa e decimal
    // lb(4,0), lb(4,1), lb(4,2) lb(4,3) // imprimir em hexa e decimal
    // lbu(4,0), lbu(4,1), lbu(4,2) lbu(4,3) // imprimir em decimal
    // lh(8,0), lh(8,2) // imprimir em hexa e decimal
    // lhu(8,0), lhu(8,2) // imprimir em decimal
    // lw(12,0), lw(16, 0), lw(20,0) // imprimir em hexa e decimal

    return 0;
}
