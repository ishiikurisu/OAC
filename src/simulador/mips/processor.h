#ifndef PROCESSOR_H
#define PROCESSOR_H

#include "./mips.h"
#include <stdbool.h>

typedef struct PROCESSOR_T {
    uint32_t *text;
    uint32_t *data;
    uint32_t *register_bank;
    bool off;
} processor_t;

// Allocates a new processor in memory and returns its correspondent pointer.
processor_t* new_processor(uint32_t* text, uint32_t* data)
{
    processor_t* processor = (processor_t*) malloc(sizeof(processor));

    processor->text = text;
    processor->data = data;
    processor->register_bank = (uint32_t*) malloc(sizeof(uint32_t) * 32);
    processor->off = false;

    return processor;
}

// Fetchs a new instruction from the instruction memory.
void fetch(processor_t* processor)
{

}

// Decodes the current instruction in memory.
void decode(processor_t* processor)
{

}

// Executes the current instruction in the processor.
void execute(processor_t* processor)
{
    processor->off = true;
}

// Frees the allocated processor.
void free_processor(processor_t* processor)
{
    free(processor->text);
    free(processor->data);
    free(processor);
}

#endif /* end of include guard: PROCESSOR_H */
