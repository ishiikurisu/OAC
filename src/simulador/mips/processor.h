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
    char *msg = debug_instruction(processor->instruction);

    if ((processor->debug) && (strcmp(msg, "nop")))
    {
        printf("%s\n", msg);
    }

    free(msg);
}

// Executes the current instruction in the processor.
void execute(processor_t* processor)
{
}

// Frees the allocated processor.
void free_processor(processor_t* processor)
{
    free(processor->text);
    free(processor->data);
    free(processor);
}

#endif /* end of include guard: PROCESSOR_H */
