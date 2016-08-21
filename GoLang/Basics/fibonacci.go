package main

import (
    "fmt"
)

func fibonacci() func() int {
    i := 0
    partsum1 := 0
    partsum2 := 0

    return func() int {
        // Base condition
        if i == 0 {
            partsum1 = 0
            i++
            return partsum1
        } else if i == 1 {
            i++
            partsum2 = 1
            return partsum2
        }

        // Fibonacci for i
        ret := partsum2 + partsum1

        // Interchange positions
        partsum1 = partsum2
        partsum2 = ret

        return ret
    }
}

func main() {
    fib := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Println(fib())
    }
}
