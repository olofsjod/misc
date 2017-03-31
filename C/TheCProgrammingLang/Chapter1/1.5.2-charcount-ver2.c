#include <stdio.h>

int main(int argc, char const *argv[]) {
    double nc;

    for (nc = 0; getchar() != EOF; ++nc)
        ;
    printf("%.0f\n", nc); // "%.0f suppresses printing of the decimal point and
                          // the fraction part, which is zero."
    return 0;
}
