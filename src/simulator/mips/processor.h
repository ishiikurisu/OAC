#ifndef PROCESSOR_H
#define PROCESSOR_H

#include "./mips.h"
#include <stdbool.h>

typedef struct {
    uint32_t *text;
    uint32_t *data;
    uint32_t *register_bank;
    bool off;
    int pc;
    bool debug;
    uint32_t instruction;
    instruction_t instruction_code;
    uint32_t opcode, rs, rt, rd, shamt, funct, imm, addr;
} processor_t;

/* Just a procedure that does nothing... */
void pass() {
  return;
}

/*
Allocates a new processor in memory and returns its correspondent pointer.
*/
processor_t* new_processor(uint32_t* text, uint32_t* data)
{
    processor_t* processor = (processor_t*) malloc(sizeof(processor));
    int i;

    processor->text = text;
    processor->data = data;
    processor->off = false;
    processor->pc = 0;
    processor->debug = false;

    processor->register_bank = (uint32_t*) malloc(sizeof(uint32_t) * 32);
    for (i = 0; i < 32; ++i)
    {
        processor->register_bank[i] = 0x0;
    }

    return processor;
}

/* Fetchs a new instruction from the instruction memory. */
void fetch(processor_t* processor)
{
    processor->instruction = processor->text[processor->pc];
    processor->pc++;
}

/* Decodes the current instruction in memory. */
void decode(processor_t* processor)
{
    uint32_t i = processor->instruction;

    processor->opcode = i >> 26;
    processor->rs = (i >> 21) & 0xf;
    processor->rt = (i >> 16) & 0xf;
    processor->rd = (i >> 11) & 0xf;
    processor->shamt = (i >> 6) & 0xf;
    processor->funct = i & 0xff;
    processor->imm = i & 0x0000FFFF;
    processor->addr = i & 0x3FFFFFF;
    processor->instruction_code = detect_instruction(processor->instruction);
}

/* Executes the current instruction in the processor. */
void execute(processor_t* processor)
{
    switch (processor->instruction_code)
    {
        case J: if (processor->debug) printf("j\n"); break;
        case JAL: if (processor->debug) printf("jal\n"); break;
        case BEQ: if (processor->debug) printf("beq\n"); break;
        case ADD:
            processor->register_bank[processor->rd] =
                processor->register_bank[processor->rs] +
                processor->register_bank[processor->rt];
            if (processor->debug) {
                printf("add $%x = %x + %x\n",
                       processor->rd,
                       processor->register_bank[processor->rs],
                       processor->register_bank[processor->rt]);
            }
            break;
        case SYSCALL:
            syscall(processor->register_bank, processor->data);
            if (processor->debug) {
                printf("syscall %d\n", processor->register_bank[2]);
            }
            if (processor->register_bank[1] == 1) { /* end the program! */
                processor->off = true;
            }
            break;
        case ADDIU:
        case ADDI:
            processor->register_bank[processor->rt] =
                processor->register_bank[processor->rs] +
                sign_ext_imm(processor->imm);
            if (processor->debug) {
                printf("addi $%lx = $%lx + %lx => %lx\n",
                        processor->rt,
                        processor->rs,
                        sign_ext_imm(processor->imm),
					    processor->register_bank[processor->rt]);
            }
            break;
        case LW:

            processor->register_bank[processor->rt] =
                lw(processor->data,
                   processor->register_bank[processor->rs],
                   sign_ext_imm(processor->imm));
            if (processor->debug) {
                printf("lw $%x <- M[$%x + %x]\n",
					   processor->rt,
                       processor->rs,
                       sign_ext_imm(processor->imm));
            }
         	break;
	  	case LUI:
			processor->register_bank[processor->rt] = processor->imm << 16;
	  		if (processor->debug) {
			  	printf("lui $%x <- %lx\n", processor->rt, processor->imm << 16);
			}
	  		break;
	  	case ORI:
	  		processor->register_bank[processor->rt] =
			  	processor->register_bank[processor->rs] | processor->imm;
	  		if (processor->debug) {
			  	printf("ori $%x <- $%x | %x\n", processor->rt,
                                                processor->rs,
                                                processor->imm);
			}
	  		break;
        default: if (processor->debug) printf("UNKNOWN\n");
    }
}

/* Frees the allocated processor. */
void free_processor(processor_t* processor)
{
    if (processor != NULL) {
        if (processor->text != NULL) {
            free(processor->text);
        }
        if (processor->data != NULL) {
            free(processor->data);
        }
        free(processor);
    }
}

#endif /* end of include guard: PROCESSOR_H */
