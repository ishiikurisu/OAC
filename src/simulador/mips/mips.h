#ifndef MIPS_H
#define MIPS_H

#include <stdio.h>
#include <stdlib.h>

// Loads a MIF executable file to an array of unsigned integer numbers, each
// representing an instruction. The last instruction is represented with a 0.
unsigned int* load_from_file(const char* input)
{
    FILE* inlet = fopen(input, "rb");
    unsigned int* outlet = NULL;

    // TODO Discover file size
    outlet = (unsigned int*) malloc(sizeof(int) * 2);
    outlet[0] = 33;
    outlet[1] = 0;

    // TODO Load whole file

    fclose(inlet);
    return outlet;
}

// Turns an unsigned integer to a string where each character is either 0 or 1,
// representing the instruction structure. The end of the string is indicated
// by a NULL pointer. The MSB is the first one by the way.
char* instruction_to_string(unsigned int instruction)
{
    char* outlet = NULL;
    int i;
    int result;
    int offset;

    outlet = (char*) malloc(sizeof(char) * 9);
    outlet[8] = '\0';
    for (i = 0; i < 8; i++)
    {
        result = (outlet[i] >> (8 - i)) & 0x1;
        outlet[i] = (result == 0x1)? '1' : '0';
    }


    return outlet;
}

#endif /* end of include guard: MIPS_H */
