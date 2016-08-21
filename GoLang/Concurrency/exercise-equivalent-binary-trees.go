package main

import (
	"fmt"
	"golang.org/x/tour/tree"
)

// Walk går igenom trädet t och skickar alla värden
// från trädet till kanalen ch.
func Walk(t *tree.Tree, ch chan int) {
        // Skickar värdet 
	ch <- t.Value

	if t.Left != nil {
		Walk(t.Left, ch)
	}
	if t.Right != nil {
		Walk(t.Right, ch)
	}
}

// Same bestämmer om trädet t1 och t2 har samma värden
func Same(t1, t2 *tree.Tree) bool {
        ch1 := make(chan int, 10)
        ch2 := make(chan int, 10)

        go Walk(t1, ch1)
        go Walk(t2, ch2)

        for i := 1; i < 10; i++ {
            tmp1 := <-ch1
            tmp2 := <-ch2

            if tmp1 != tmp2 {
                return false
            }
        }
        return true
}

func main() {
        //myTree := &tree.Tree{&tree.Tree{nil,3,nil},5,&tree.Tree{nil,7,&tree.Tree{nil,4,nil}}}
	//ch := make(chan int, 10)
	//go Walk(tree.New(1), ch)

        //go Walk(myTree, ch)
        treeP1 := tree.New(1)
        treeP2 := tree.New(2)
        fmt.Println(Same(treeP1, treeP2))

        // VARFÖR
        // Same(tree.New(1), tree.New(1)) -> False (???)

}
