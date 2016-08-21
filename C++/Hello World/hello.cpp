#include <iostream>
#include <string>

using namespace std;

/*
 * Hello world 
 */

class Hello {
    int width, height;
    public:
        void set_values(int, int);
        int area() { return width*height; }
};

void Hello::set_values ( int x, int y ) {
    width = x;
    height = y;
}

int main() {
    Hello hel;
    hel.set_values(3,4);
    cout << "area: " << hel.area() << endl;

    int c;
    int a = 5;
    int* b = &a;
    c=a;
    c=6;
    a=7;
    cout << *b; 

}
