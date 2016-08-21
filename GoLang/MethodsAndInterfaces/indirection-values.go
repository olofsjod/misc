package main

import (
	"fmt"
	"math"
)

// Definerar en 'Struktur' på en nod.
type Vertex struct {
	X, Y float64
}

// Skriver man på det här viset fungerar denna ungefär som en instansmetod.
func (v Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func AbsFunc(v Vertex) float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func main() {
	v := Vertex{3, 4}
	fmt.Println(v.Abs())
	fmt.Println(AbsFunc(v))

	p := &Vertex{4, 3}
	fmt.Println(p.Abs()) // I det här fallet så kommer Go att tolka detta som (*p).Abs()
	fmt.Println(AbsFunc(*p))
}
