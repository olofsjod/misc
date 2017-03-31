#include <stdio.h>

int main(int argc, char const *argv[]) {
    int x, y, *ip;
    x = 1;
    y = 2;
    ip = &x;
    x = 3;
    y = *ip;
    *ip = 0;    // x here is 0
    // x = &y; Is not possible, x needs to have the type point to int.
    
    return 0;
}
