#include <stdio.h>

#define     TAB_SIZE    1

/* detab: replacing tabs with a fixed num of spaces to the next tab stop */

void print_spaces(int n);

int main(int argc, char const *argv[]) {
    int c, steps_to_next_tabstop;

    steps_to_next_tabstop = TAB_SIZE;

    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            steps_to_next_tabstop = TAB_SIZE;
            putchar(c);
        } else {
            if (c == '\t') {
                print_spaces(steps_to_next_tabstop);
            } else {
                putchar(c);
            }

            if (steps_to_next_tabstop == 0)
                steps_to_next_tabstop = TAB_SIZE-1;
            else
                steps_to_next_tabstop -= 1;
        }
    }
    return 0;
}

void print_spaces(int n) {
    for (int i = 0; i < n; ++i)
        putchar(' ');
}
