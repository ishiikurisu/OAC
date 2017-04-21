#include <stdio.h>

int main(int argc, char const *argv[]) {
    printf("before...\n");
    1/0;
    printf("after\n");
    return 0;
}
