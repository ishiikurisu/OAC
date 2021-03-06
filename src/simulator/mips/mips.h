#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/*
Displays a piece of memory tape.
*/
void display_tape(uint32_t *tape, uint32_t how_much)
{
	uint32_t i;

  	for (i = 0; i < how_much; ++i) {
	  	printf("%x. %lx\n", i, tape[i]);
	}
}

/*
Calculates how many instructions there are in a source code using its
file pointer.
*/
int get_how_many_instructions(FILE* inlet)
{
    int limit = -1;
    fseek(inlet, 0L, SEEK_END);
    limit = ftell(inlet);
    rewind(inlet);
    return limit;
}

/*
Calculates how many instructions there are in a source code using its
file path.
*/
int count_instructions(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    int limit = get_how_many_instructions(inlet);
    fclose(inlet);
    return limit;
}

/*
Loads a binary executable file to an array of unsigned integer numbers, each
representing an instruction. The last instruction is represented with a 0.
*/
uint32_t* load_from_file(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    uint32_t* outlet = NULL;

    outlet = (uint32_t*) malloc(sizeof(uint32_t) * 0x4000);
    fread(outlet, sizeof(uint32_t), 0x4000, inlet);
    outlet[4096] = 0;
    fclose(inlet);

    return outlet;
}

/* Those are the definitions of constants for instructions in MIPS. */
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
  	LUI,
  	ORI,
    UNKNOWN
} instruction_t;

/*
Detects an instruction and assigns the result to a code, as described by the
`INSTRUCTION_CODE` enumeration.
*/
int detect_instruction(uint32_t instruction)
{
    int opcode;
    int funct;
    int name = UNKNOWN;

    /* immediate cases */
    if (instruction == 0xc) {
        return SYSCALL;
    } else if (instruction == 0x0) {
        return NOP;
    }

    /* detecting opcode */
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
	  	case 0xD: name = ORI; break;
	  	case 0xF: name = LUI; break;
        case 0x23: name = LW; break;
    }


    return name;
}

/* Writes the string starting at the address a0 in memory. */
void syscall4(uint32_t* mem, uint32_t a0)
{
    unsigned char c = '\0';
    int i = 0;

    c = (mem[a0+(i/4)] >> 8*(i % 4)) & 0xFF;
    while (c != '\0')
    {
        printf("%c", c);
        i++;
        c = (mem[a0+(i/4)] >> 8*(i % 4)) & 0xFF;
    }
}

/* Simulates the `syscall` command using the current registers. */
void syscall(uint32_t *registers, uint32_t *memory)
{
    long v0 = registers[2];
    long a0 = registers[4];

    registers[1] = 0;
    switch (v0) {
        case 1:
            printf("%ld", a0);
            break;

        case 4:
            syscall4(memory, (a0-0x2000)/4);
            break;

        case 5:
            scanf("%ld", &v0);
            registers[2] = v0;
            break;

        case 10:
            registers[1] = 1;
            break;

        default:
            printf("syscall %d not implement yet\n", v0);
    }
}

/* Extends the signal of an immediante number. */
uint32_t sign_ext_imm(uint32_t i)
{
    return ((i >> 15) & 0x1)? (0xFFFF0000 | i) : i;
}

/*
Simulates the execution of a `lw` instruction. Returns a word from memory.
*/
uint32_t lw(uint32_t *data, uint32_t rs, uint32_t imm)
{
  	return data[(rs - 0x2000) / 4];
}

#endif /* end of include guard: MIPS_H */
