#include <stdlib.h>
#include "./mips/mips.h"

int main(int argc, char const *argv[]) {
    const char *src = argv[1];
    int instruction_count = count_instructions(src);
    unsigned long* instructions = load_from_file(src);
    unsigned long instruction;
    char* long_instruction;
    int i;

    for (i = 0; i < instruction_count; ++i) {
        instruction = instructions[i];
        long_instruction = debug_instruction(instruction);
        printf("%lx = %s\n", instruction, long_instruction);
        free(long_instruction);
    }

    free(instructions);
    return 0;
}
