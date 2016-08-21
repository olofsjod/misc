package main

import "fmt"
import "strconv"
import "strings"

type IPAddr [4]byte

func uint8ToInt(b uint8) int {
    var sum int = int(b)
    return sum
}

type IPString []string

func (s IPString) String() string {
    return strings.Join(s, ".")
}

func (ip IPAddr) String() string {
    var str IPString

    for _,deByte := range ip {
       str = append(str, strconv.Itoa(uint8ToInt(deByte)))
    }

    return str.String()
}


func main() {
    hosts := map[string]IPAddr{
        "loopback": {127, 0, 0, 1},
        "googleDNS": {8, 8, 8, 8},
    }
    for name, ip := range hosts {
        fmt.Printf("%v: %v\n", name, ip)
    }
    uint8ToInt(uint8(63))
}
