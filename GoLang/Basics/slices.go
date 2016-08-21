package main

import "fmt"

func main() {
    a := make([]int, 5)     // Standardvärdet för en 'slice' är nollor
    b := make([]int, 0, 5)  // Man kan tvinga slicen att vara av en viss längd
    
    a[0] = 1337
    c := a 
    c[0] = 1331             // c och a pekar på samma slice
    a = append(a, 1337) // Man kan förlänga en slice.
    b = append(b, 1338)

    printSlice("a", a)
    printSlice("b", b)
}

func printSlice(s string, x []int) {
    fmt.Printf("%s len=%d cap=%d %v\n",
        s, len(x), cap(x), x)
}
