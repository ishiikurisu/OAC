#include <stdlib.h>
#include "./mips/mips.h"

int main(int argc, char const *argv[]) {
    const char *text = argv[1];
    const char *data = argv[2];
    int instruction_count = count_instructions(text);
    unsigned long* instructions = load_from_file(text);
    long* memory = load_memory(data);

    execute(instruction_count, instructions, NULL);
    free(instructions);
    free(memory);

    return 0;
}
