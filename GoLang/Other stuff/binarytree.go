package main

import "fmt"

type Node struct {
    Left *Node
    Value int
    Right *Node
}


func (n *Node) search(elem int) int {
    // TODO
}

func (n *Node) add(elem int) {
    fmt.Println("Lägger till", elem)

    if n.Value == 0 {
        fmt.Println("Det finns inget värde för denna nod! Ändrar på detta...")
        n.Value = elem
        return
    }

    if n.Value < elem {
        fmt.Println("Värdet är störe än rot... lägger till höger")
        if n.Right == nil {
            ret := Node{nil, elem, nil}
            n.Right = &ret
        } else {
            (n.Right).add(elem)
        }
        return
    }

    if n.Value > elem {
        fmt.Println("Värdet är mindre än rot... lägger till vänster")
        if n.Left == nil {
            ret := Node{nil, elem, nil}
            n.Left = &ret
        } else {
            (n.Left).add(elem)
        }
        return
    }
}

func main() {
    addToTree := [7]int{5, 2, 3, 4, 5, 6, 9}

    var root Node

    for _, element := range addToTree {
        root.add(element)
    }
}
