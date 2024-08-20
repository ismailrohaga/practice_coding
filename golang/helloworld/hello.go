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
// [x] only responsible for returning the string
// [x] take out the language switcher
func Hello(name string, lang string) string {
	// doesn't need ; at the end
	var prefix string = getGreetingPrefix(lang)

	if name == "" {
		return prefix
	}

	return fmt.Sprintf("%s %s!", prefix, name)
}

func getGreetingPrefix(lang string) string {
	switch lang {
	case EN:
		return HELLO_EN
	case ID:
		return HELLO_ID
	default:
		return HELLO_EN
	}
}
