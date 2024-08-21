package iteration

import "testing"

func TestRepeat(t *testing.T) {
	got := Repeat("s")
	want := "ssss"

	if got != want {
		t.Errorf("Repeat() = %v, want %v", got, want)
	}
}
