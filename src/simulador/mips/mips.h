#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Calculates how many instructions there are in a source code using its
// file pointer.
int get_how_many_instructions(FILE* inlet)
{
    int limit = -1;
    fseek(inlet, 0L, SEEK_END);
    limit = ftell(inlet);
    rewind(inlet);
    return limit;
}

// Calculates how many instructions there are in a source code using its
// file path.
int count_instructions(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    int limit = get_how_many_instructions(inlet);
    fclose(inlet);
    return limit;
}

// Loads a binary executable file to an array of unsigned integer numbers, each
// representing an instruction. The last instruction is represented with a 0.
uint32_t* load_from_file(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    uint32_t* outlet = NULL;

    outlet = (uint32_t*) malloc(sizeof(uint32_t) * 4097);
    fread(outlet, sizeof(uint32_t), 4097, inlet);
    outlet[4096] = 0;
    fclose(inlet);

    return outlet;
}

// Those are the definitions of constants for instructions in MIPS.
typedef enum {
    ADD,
    ADDI,
    ADDIU,
    J,
    JAL,
    BEQ,
    BNE,
    LI,
    LW,
    SYSCALL,
    NOP,
    UNKNOWN
} instruction_t;

// Detects an instruction and assigns the result to a code, as described by the
// `INSTRUCTION_CODE` enumeration.
int detect_instruction(uint32_t instruction)
{
    int opcode;
    int funct;
    int name = UNKNOWN;

    // immediate cases
    if (instruction == 0xc) {
        return SYSCALL;
    } else if (instruction == 0x0) {
        return NOP;
    }

    // detecting opcode
    opcode = instruction >> 26;
    funct = instruction & 0x3f;
    switch (opcode) {
        case 0x0:
            switch (funct) {
                case 0x20: name = ADD; break;
                default: name = NOP;
            }
        break;
        case 0x2: name = J; break;
        case 0x4: name = BEQ; break;
        case 0x8: name = ADDI; break;
        case 0x9: name = ADDIU; break;
        case 0x23: name = LW; break;
    }


    return name;
}

// Simulates the `syscall` command using the current registers.
void syscall(uint32_t *registers, uint32_t *memory)
{
    long v0 = registers[2];
    long a0 = registers[4];

    registers[1] = 0;
    switch (v0) {
        case 1:
            printf("%ld\n", a0);
            break;

        case 4:
            while (memory[a0] != '\0') {
                printf("%c", memory[a0]);
                a0++;
            }
            break;

        case 5:
            scanf("%ld", &v0);
            registers[2] = v0;
            break;

        case 10:
            registers[1] = 1;

        default:
            printf("syscall %d not implement yet\n", v0);
    }
}

#endif /* end of include guard: MIPS_H */
