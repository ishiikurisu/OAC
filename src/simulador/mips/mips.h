#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>

// Loads a MIF executable file to an array of unsigned integer numbers, each
// representing an instruction. The last instruction is represented with a 0.
unsigned long* load_from_file(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    unsigned long* outlet = NULL;
    int limit;
    int i;

    fseek(inlet, 0L, SEEK_END);
    limit = ftell(inlet);
    rewind(inlet);
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

#endif /* end of include guard: MIPS_H */
