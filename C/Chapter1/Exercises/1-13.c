#include <stdio.h>

#define MAX_WORD_SIZE   30
#define IN              1
#define OUT             0

int main(int argc, char const *argv[]) {
    int state, char_counter, c;
    int histogram[MAX_WORD_SIZE];

    /* Initialize every element in the array with number zero */
    for (int i = 0; i < MAX_WORD_SIZE; ++i)
        histogram[i] = 0;

    /* Generate histogram array */
    state = OUT;
    char_counter = 0;
    while ((c = getchar()) != EOF) {
        /*  If the character is a space, newline or tab and the state before was
            IN. Add to the histogram. */
        if (c == ' ' || c == '\n' || c == '\t') {
            if (state == IN) {
                ++histogram[char_counter-1];
            }

            /* Reset state */
            char_counter = 0;
            state = OUT;
        } else {
            ++char_counter;
            state = IN;
        }
    }

    /* Print histogram */
    for (int i = 0; i < MAX_WORD_SIZE; ++i) {
        int bar_size = histogram[i];
        printf("%d\t", i+1);
        for (int k = 0; k < bar_size; ++k)
            printf("#");
        printf("\n");
    }

    return 0;
}
