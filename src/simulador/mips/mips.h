#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>

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

// Loads a MIF executable file to an array of unsigned integer numbers, each
// representing an instruction. The last instruction is represented with a 0.
unsigned long* load_from_file(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    unsigned long* outlet = NULL;
    int limit;
    int i;

    limit = get_how_many_instructions(inlet);
    outlet = (unsigned long*) malloc(sizeof(long) * (limit+1));
    fread(outlet, sizeof(long), limit, inlet);
    outlet[limit] = 0;
    fclose(inlet);

    return outlet;
}

// Turns an unsigned integer to a string where each character is either 0 or 1,
// representing the instruction structure. The end of the string is indicated
// by a NULL pointer. The MSB is the first one by the way.
char* instruction_to_string(unsigned long instruction)
{
    char* outlet = NULL;
    int i;
    int result;
    int offset;

    outlet = (char*) malloc(sizeof(char) * 33);
    outlet[32] = '\0';
    for (i = 0; i < 32; i++)
    {
        result = (outlet[i] >> (32 - i)) & 0x1;
        outlet[i] = (result == 0x1)? '1' : '0';
    }


    return outlet;
}

// Those are the definitions of constants for instructions in MIPS.
typedef enum {
    ADD,
    ADDIU,
    J,
    JAL,
    BEQ,
    BNE,
    LI,
    SYSCALL,
    NOP,
    UNKNOWN
} INSTRUCTION_CODE;

// Detects an instruction and assigns the result to a code, as described by the
// `INSTRUCTION_CODE` enumeration.
int detect_instruction(unsigned long instruction)
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
        case 0x9: name = ADDIU; break;
    }


    return name;
}

// Turns a binary instruction into a .
char* debug_instruction(unsigned long instruction)
{
    char* outlet;
    int name;
    int i;

    outlet = (char*) malloc(sizeof(char) * 64);
    for (i = 0; i < 64; outlet[i] = 0, ++i);
    name = detect_instruction(instruction);

    switch (name)
    {
        case J: sprintf(outlet, "j"); break;
        case JAL: sprintf(outlet, "j"); break;
        case BEQ: sprintf(outlet, "beq"); break;
        case BNE: sprintf(outlet, "bne"); break;
        case ADD: sprintf(outlet, "add"); break;
        case LI: sprintf(outlet, "li"); break;
        case SYSCALL: sprintf(outlet, "syscall"); break;
        case ADDIU: sprintf(outlet, "addiu"); break;
        case NOP: sprintf(outlet, "nop"); break;
        default: sprintf(outlet, "UNKNOWN");
    }

    return outlet;
}

#endif /* end of include guard: MIPS_H */
