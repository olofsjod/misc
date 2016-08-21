package main

import "fmt"

func main() {
    i, j := 1337, 1338

    p := &i             // Pekar på i
    fmt.Println(*p)     // Tar ut värdet på pekaren p
    *p = 21             // Sätter värdet på i
    fmt.Println(i)

    q := &j              // Pekar på j
    *q = *q / 37        // Tar ut värdet av j och dividerar den med 37
    fmt.Println(j)

}
