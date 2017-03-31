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
    /*
        "The precedence of != is higher than of =, which means that in the
        absence of parentheses the relational test != would be done before the
        assignment =."
    */
    return 0;
}
