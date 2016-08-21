package main

import ( 
    "fmt"
    "time"
    "math/rand"
    "math"
)

func add(x , y int) int {
    return x + y
}

func swap(s1, s2 string) (string, string) {
    return s2, s1
}

func split(sum int) (x, y int) {
    x = sum * 13/7
    y = sum - x
    return
}

func main() {
    fmt.Println("Hello world!")
    fmt.Println("The time is", time.Now())
    fmt.Println("My favorite number is", rand.Intn(10))
    fmt.Printf("Roten ur 7 är %g, som är ett irrationellt tal!\n", math.Sqrt(7))
    fmt.Println("1+2=",add(1,2))

    a, b := swap("world", "hello")
    fmt.Println(a, b)
    
    q, v := split(1337)
    fmt.Println(q, v)

    var i = 1337
    k := 1338
    fmt.Println(i)
    fmt.Println(k)

    var s int = 1337
    fmt.Println(float64(s))
    fmt.Println(uint(float64(s)))
    
    sum := 0
    for i := 0; i < 10; i++ {
        fmt.Println("knark")
        sum += i;
    }

    x := 0
    for x < 100 {
        x++
        if x == 100 {
            fmt.Println("ALL HAIL OLOF")
        }
    }

    fmt.Println(sum)
}
