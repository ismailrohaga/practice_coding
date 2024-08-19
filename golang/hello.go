package main

// this includes Println functions
import "fmt"

func main() {
	v := "Bro"
	fmt.Println(Hello(v))
}

// function return type is defined after the function name
// can we have some kind of nullable type?
func Hello(name string) string {
	// doesn't need ; at the end
	if name == "" {
		return "Hello There!"
	} else {
		return "Hello There! " + name + "!"
	}
}

func Calculate(a, b int) int {
	return a + b
}
