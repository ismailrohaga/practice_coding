package main

// this includes Println functions
import "fmt"

const (
	EN       = "English"
	ID       = "Bahasa"
	HELLO_EN = "Hello There!"
	HELLO_ID = "Hai Kamu!"
)

func main() {
	v := "Bro"
	fmt.Println(Hello(v, "Bahasa"))
}

// function return type is defined after the function name
// can we have some kind of nullable type?
// TODO: refactor this function
// [ ] only responsible for returning the string
// [ ] take out the language switcher
func Hello(name string, lang string) string {
	// doesn't need ; at the end
	var prefix string

	switch lang {
	case EN:
		prefix = HELLO_EN
	case ID:
		prefix = HELLO_ID
	default:
		prefix = HELLO_EN
	}

	if name == "" {
		return prefix
	} else {
		// TODO: use proper string builder?
		return prefix + " " + name + "!"
	}
}

func Calculate(a, b int) int {
	return a + b
}
