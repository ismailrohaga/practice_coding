package main

import "testing"

// need to be in a file with the name any_test.go
// func name must start with Test
// takes only one args

func TestHello(t *testing.T) {
	// it's possible to have multiple tests, AKA subtest inside one function
	t.Run("without args", func(t *testing.T) {
		got := Hello("", "")
		want := "Hello There!"
		assertString(t, got, want)
	})
	t.Run("with args", func(t *testing.T) {
		got := Hello("Bro", "")
		want := "Hello There! Bro!"
		assertString(t, got, want)
	})
	t.Run("with lang", func(t *testing.T) {
		got := Hello("Bro", "Bahasa")
		want := "Hai Kamu! Bro!"
		assertString(t, got, want)
	})
}

func subTest(name, got, want string) {
  t.Run(name, func(t *testing.T) {
	assertString(t, got, want)
  }
}

// doesn't care about the order of function calls
// var type can be defined for two var
func assertString(t *testing.T, got, want string) {
	t.Helper()
	if got != want {
		t.Errorf("Got %q want %q", got, want)
	}
}

func assertNumber(t *testing.T, got int, want int) {
	t.Helper() // a flag to indicate that the function is a helper function
	if got != want {
		t.Errorf("Got %q want %q", got, want)
	}
}

func TestCalculate(t *testing.T) {
	a := 1
	b := 2
	got := Calculate(a, b)
	want := a + b
	assertNumber(t, got, want)
}
