#include <stdlib.h>
#include "./mips/mips.h"

int main(int argc, char const *argv[]) {
    const char *src = argv[1];
    unsigned long* instructions = load_from_file(src);
    unsigned long instruction;
    int i;

    for (i = 0; instructions[i] != 0; ++i) {
        instruction = instructions[i];
        printf("%lx\n", instruction);
    }

    free(instructions);
    return 0;
}
