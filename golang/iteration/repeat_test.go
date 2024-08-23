package iteration

import (
	"fmt"
	"testing"
)

func TestRepeat(t *testing.T) {
	got := Repeat("s", 4)
	want := "ssss"

	if got != want {
		t.Errorf("Repeat() = %v, want %v", got, want)
	}
}

func ExampleRepeat() {
	s := Repeat("s", 6)
	fmt.Println(s)
	// Output: ssssss
}

// to run: `go test -bench=.`
func BenchmarkRepeat(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Repeat("s", 4)
	}
}
