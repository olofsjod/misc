#include <stdio.h>

/* copy input to output */

int main(int argc, char const *argv[]) {
    int c;
    /*
        "The while gets a character, assigns it to c, and then tests whether the
        character was the end-of-file signal."
    */
    while ((c = getchar()) != EOF)
        putchar(c); // output
    return 0;
}
