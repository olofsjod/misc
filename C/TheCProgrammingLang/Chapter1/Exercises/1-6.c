#include <stdio.h>

int main(int argc, char const *argv[]) {
    int c, k;
    while ((c = getchar()) != EOF) {
        k = c != EOF;
        printf("%d\n", k);
    }
    k = c != EOF;
    printf("%d\n", k);
}
