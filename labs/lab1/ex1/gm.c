#include <stdio.h>
#include <stdlib.h>

const int ws[] = {1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100,-1};

int main(int argc, char const *argv[]) {
    FILE *fp = fopen("makefile", "w");
    int i, n;
    fprintf(fp, "do:");
    for (i = 0; ws[i] >= 0; i++)
    {
        fprintf(fp, " a%d", ws[i]);
    }
    fprintf(fp, "\n");
    fprintf(fp, "gen:\n");
    fprintf(fp, "\tgcc generate_arrays.c -o gen.exe -O2\n");
    for (i = 0; ws[i] >= 0; i++)
    {
        fprintf(fp, "a%d: gen\n", ws[i]);
        fprintf(fp, "\t./gen.exe %d > a%d.txt\n", ws[i], ws[i]);
    }
    fclose(fp);
    return 0;
}
