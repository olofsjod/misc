#include <stdio.h>

int main(int argc, char const *argv[]) {
    int c;
    int blankStreak = 0;

    while ((c = getchar()) != EOF) {
        if (c == ' ' && blankStreak >= 1)
            ++blankStreak;
        else {
            if (c == ' ')
                ++blankStreak;
            else
                blankStreak = 0;
            putchar(c);
        }
    }
    return 0;
}
