#include <stdio.h>

int main(int argc, char const *argv[]) {
    int c;
    int num_blanks, num_tabs, num_newlines;
    num_blanks = num_tabs = num_newlines = 0;

    while ((c = getchar()) != EOF) {
        if (c == ' ')
            ++num_blanks;
        else if (c == '\t')
            ++num_tabs;
        else if (c == '\n')
            ++num_newlines;
    }
    printf("%d %d %d\n", num_blanks, num_tabs, num_newlines);
    return 0;
}
