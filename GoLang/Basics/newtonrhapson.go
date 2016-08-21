package main

import (
    "fmt"
    "math"
)

func newVal(i, x float64) float64 {
    return i-(math.Pow(i, 2)-x)/(2*i)
}

func Sqrt(x float64) float64 {
    var ret float64 = 1.0 // Initial guess

    for i := 0; i < 10; i++ {
        ret = newVal(ret, x)
    }
    return ret
}

func main() {
    fmt.Println(Sqrt(2))
    fmt.Println(math.Sqrt(2))

}
