#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
    int n, i;

    sscanf(argv[1], "%d", &n);
    for (i = 0; i < n; i++)
        printf("%d,", i+1);
    printf("\n");
    for (i = n; i > 0; i--)
        printf("%d,", i);
    printf("\n");

    return 0;
}
