package iteration

import "fmt"

func Repeat(s string) string {
	var repeated string
	for i := 0; i < 4; i++ {
		repeated = repeated + s
	}
	return repeated
}

// ways to declare variables in go
func declareVariables() {
    var a = "initial" // a is a string
    fmt.Println(a)

    //can declare multiple variables at once.
    var b, c int = 1, 2 // b and c is an int
    fmt.Println(b, c)

    var d = true // d is a bool
    fmt.Println(d)

    var e int 
    fmt.Println(e) // will print 0 because e is not initialized, thus it's "zero-valued"

    f := "apple" // shorthand declaration for var f string = "apple"
    fmt.Println(f)
}
