package main

import (
	"testing"
)

func TestHello(t *testing.T) {
	expected := "hello world!"
	actual := Hello("world")

	if actual != expected {
		t.Fatalf(`Hello("world") = %q, expected %q`, actual, expected)
	}
}
