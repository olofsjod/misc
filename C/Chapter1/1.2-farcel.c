#include <stdio.h>

// Example 1.2 page 9
// Build: cc farcel.c

int main(int argc, char const *argv[]) {
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;      /* lower limit of temperature table */
    upper = 300;    /* upper limit */
    step = 20;

    fahr = lower;
    while (fahr <= upper) {
        // "integer division truncates: any fractional part is discarded"
        celsius = 5 * (fahr - 32)/9;
        printf("%d\t%d\n", fahr, celsius);
        fahr = fahr + step;
    }
    return 0;
}
