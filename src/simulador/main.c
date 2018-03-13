#include "./mips/mips.h"

int main(int argc, char const *argv[]) {
    const char *src = argv[1];
    unsigned int* instructions = load_from_file(src);
    unsigned int instruction;
    int i;

    for (i = 0; instructions[i] != 0; ++i) {
        instruction = instructions[i];
        printf("%s\n", instruction_to_string(instruction));
    }

    return 0;
}
