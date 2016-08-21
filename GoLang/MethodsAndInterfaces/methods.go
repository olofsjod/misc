package main

import (
    "fmt"
    "math"
)
/*
    Go har inga klasser, så man kan inte programmera objekts orienterat i Go.
    Men man kan t.ex. utnyttja 'structs' som om de vore ett objekt med metoder. 
    Genom att man anger i varje funktion en mottagare av en 'struct' så kommer
    det fungera på ett ungefär som en instansmetod för varje 'struct'.
*/

type Vertex struct {
    X, Y float64
}

type MyFloat float64

func (v Vertex) Abs() float64 {
    // v är här en mottagare med typ 'Vertex'
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

// En metod behöver inte vara en struct.
func (v MyFloat) Abs() float64 {
    if v < 0 {
        return float64(-v)
    }
    return float64(v)
}

func main() {
    v := Vertex{3, 4}
    fmt.Println(v.Abs())

    f := MyFloat(-math.Sqrt(2))
    fmt.Println(f.Abs())
}
