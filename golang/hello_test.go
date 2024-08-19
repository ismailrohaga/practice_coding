package main

import "testing"

// need to be in a file with the name any_test.go
// func name must start with Test
// takes only one args

func TestHello(t *testing.T) {
	got := Hello("")
	want := "Hello There!"

	if got != want {
		t.Errorf("Got %q want %q", got, want)
	}
}

func TestHelloArgs(t *testing.T) {
	got := Hello("Bro")
	want := "Hello There! Bro!"

	if got != want {
		t.Errorf("Got %q want %q", got, want)
	}
}

func TestCalculate(t *testing.T) {
	a := 1
	b := 2
	got := Calculate(a, b)
	want := a + b

	if got != want {
		t.Errorf("Got %d want %d", got, want)
	}
}
