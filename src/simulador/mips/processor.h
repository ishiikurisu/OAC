#ifndef PROCESSOR_H
#define PROCESSOR_H

#include "./mips.h"
#include <stdbool.h>

typedef struct PROCESSOR_T {
    uint32_t *text;
    uint32_t *data;
    uint32_t *register_bank;
    bool off;
    int pc;
    bool debug;
    uint32_t instruction;
    instruction_t instruction_code;
    int opcode, rs, rt, rd, shamt, funct, imm, addr;
} processor_t;

// Allocates a new processor in memory and returns its correspondent pointer.
processor_t* new_processor(uint32_t* text, uint32_t* data)
{
    processor_t* processor = (processor_t*) malloc(sizeof(processor));
    int i;

    processor->text = text;
    processor->data = data;
    processor->register_bank = (uint32_t*) malloc(sizeof(uint32_t) * 32);
    processor->off = false;
    processor->pc = 0;
    processor->debug = false;

    for (i = 0; i < 32; ++i)
    {
        processor->register_bank[i] = 0;
    }

    return processor;
}

// Fetchs a new instruction from the instruction memory.
void fetch(processor_t* processor)
{
    processor->instruction = processor->text[processor->pc];
    processor->pc++;
}

// Decodes the current instruction in memory.
void decode(processor_t* processor)
{
    uint32_t i = processor->instruction;

    processor->opcode = i >> 26;
    processor->rs = (i >> 21) & 0x3f;
    processor->rt = (i >> 16) & 0x3f;
    processor->rd = (i >> 11) & 0x3f;
    processor->shamt = (i >> 6) & 0x3f;
    processor->funct = i & 0x3f;
    processor->imm = i & 0xFFFF;
    processor->addr = i & 0x3FFFFFF;
    processor->instruction_code = detect_instruction(processor->instruction);
}

// Executes the current instruction in the processor.
void execute(processor_t* processor)
{
    switch (processor->instruction_code)
    {
        case J: printf("j "); break;
        case JAL: printf("jal "); break;
        case BEQ: printf("beq "); break;
        case ADD: printf("add "); break;
        case LI: printf("li "); break;
        case SYSCALL: printf("syscall "); break;
        case ADDIU: printf("addiu "); break;
        case ADDI: printf("addi "); break;
        case LW: printf("lw "); break;
        default: printf(".");
    }
}

// Frees the allocated processor.
void free_processor(processor_t* processor)
{
    free(processor->text);
    free(processor->data);
    free(processor);
}

#endif /* end of include guard: PROCESSOR_H */
