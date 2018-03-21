#include <stdlib.h>
#include "./mips/mips.h"

int main(int argc, char const *argv[]) {
    const char *src = argv[1];
    int instruction_count = count_instructions(src);
    unsigned long* instructions = load_from_file(src);

    execute(instruction_count, instructions);

    free(instructions);
    return 0;
}
