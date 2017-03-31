#include <stdio.h>
#define LOWER 0
#define UPPER 300
#define STEP 20

// Example 1.3 page 13
// Build: cc 1.4-farcel-float-for-define.c

int main(int argc, char const *argv[]) {
    float celsius;
    int fahr;

    for (fahr = LOWER; fahr <= UPPER; fahr = fahr + STEP) {
        celsius = 5.0/9.0 * (fahr - 32.0);
        printf("%3d %6.1f\n", fahr, celsius);
    }

    return 0;
}
