package main

import (
    "fmt"
    "math"
)

type ErrNegativeSqrt float64

func (e ErrNegativeSqrt) Error() string {
    var number string = fmt.Sprint(float64(e))
    
    return "cannot Sqrt negative number:" + number
}

func newVal(i, x float64) float64 {
    return i-(math.Pow(i, 2)-x)/(2*i)
}

func Sqrt(x float64) (float64, error) {
    if x < 0 {
        return 0.0, ErrNegativeSqrt(x)
    }
    var ret float64 = 1.0 // Initial guess

    for i := 0; i < 10; i++ {
        ret = newVal(ret, x)
    }
    return ret, nil
}

func main() {
    fmt.Println(Sqrt(2))
    fmt.Println(Sqrt(-2)) // Ska ge fel
}
