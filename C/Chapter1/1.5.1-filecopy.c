#include <stdio.h>

/* copy input to output */

int main(int argc, char const *argv[]) {
    int c;

    c = getchar(); // STDIN
    while (c != EOF) {
        putchar(c); // STDOUT
        c = getchar();
    }
    return 0;
}
