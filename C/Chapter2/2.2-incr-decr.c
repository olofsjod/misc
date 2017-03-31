#include <stdio.h>

int main(int argc, char const *argv[]) {
    for (int i = 0; i < 4; ++i)
        printf("%d\n", i);
    for (int i = 0; i < 4; i++)
        printf("%d\n", i);
    return 0;
}
