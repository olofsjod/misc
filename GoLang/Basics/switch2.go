package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("When's Saturday?")
	today := time.Now().Weekday()
	switch time.Saturday {
	case today + 0:
		fmt.Println("Idag.")
	case today + 1:
		fmt.Println("Imorgon.")
	case today + 2:
		fmt.Println("Övermorgon")
	default:
		fmt.Println("För långt bort...")
	}
}
