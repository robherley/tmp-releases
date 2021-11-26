package main

import "fmt"

func Hello(to string) string {
	return fmt.Sprintf("hello %s!", to)
}

func main() {
	s := Hello("world")

	fmt.Println(s)
}
