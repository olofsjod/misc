#include <stdio.h>

int main(int argc, char const *argv[]) {
    long nc;

    nc = 0;
    while (getchar() != EOF)
        ++nc;   // same as nc = nc + 1
    printf("%ld\n", nc);
    return 0;
}
