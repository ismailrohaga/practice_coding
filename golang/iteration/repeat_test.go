package iteration

import "testing"

func TestRepeat(t *testing.T) {
	got := Repeat("s")
	want := "ssss"

	if got != want {
		t.Errorf("Repeat() = %v, want %v", got, want)
	}
}

// to run: `go test -bench=.`
func BenchmarkRepeat(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Repeat("s")
	}
}
