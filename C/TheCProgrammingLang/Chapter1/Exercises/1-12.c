#include <stdio.h>

#define IN              1       /* inside a word */
#define OUT             0       /* outside a word */

#define PRINTED_NEWLINE         1
#define NOT_PRINTED_NEWLINE     0

int main(int argc, char const *argv[]) {
    int c, nl, nw, nc, state, newline_state;

    state = OUT;
    newline_state = NOT_PRINTED_NEWLINE;
    nl = nw = nc = 0;
    while ((c = getchar()) != EOF) {
        ++nc;
        if (c == '\n')
            ++nl;
        if (c == ' ' || c == '\n' || c == '\t'){
            state = OUT;
            if (newline_state == NOT_PRINTED_NEWLINE) {
                putchar('\n');
                newline_state = PRINTED_NEWLINE;
            }
        }
        else if (state == OUT) {
            state = IN;
            newline_state = NOT_PRINTED_NEWLINE;

            ++nw;
            putchar(c);
        }
        else {
            newline_state = NOT_PRINTED_NEWLINE;
            putchar(c);
        }
    }

    return 0;
}
