#include <stdio.h>

// Example 1.3 page 13
// Build: cc farcel-float-for.c

int main(int argc, char const *argv[]) {
    float celsius;
    int fahr;

    for (fahr = 0; fahr <= 300; fahr = fahr + 20) {
        celsius = 5.0/9.0 * (fahr - 32.0);
        printf("%3d %6.1f\n", fahr, celsius);
    }

    return 0;
}
