package main

import (
    "fmt"
    "math"
)

type Abser interface {
    Abs() float64
}

type MyFloat float64

func (f MyFloat) Abs() float64 {
    if f < 0 {
        return float64(-f)
    }
    return float64(f)
}

type Vertex struct {
    X, Y float64
}

func (v *Vertex) Abs() float64 {
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func PrintAbs(a Abser) {
    fmt.Println(a.Abs())
}

func main() {
    var a Abser
    f := MyFloat(-math.Sqrt2)
    v := Vertex{3, 4}

    a = f  // a MyFloat implementerar Abser
    a = &v // a *Vertex implementerar Abser

    // Eftersom Vertex inte har en metod som heter Abs() så kommer följande 
    // rad att fungera.
    //a = v
    PrintAbs(a)
}
