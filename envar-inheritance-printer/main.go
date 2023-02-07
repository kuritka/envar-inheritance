package main

import (
	"fmt"
	"k8s.io/utils/env"
)

// envar-inheritance-PRINTER
func main() {
	x := env.GetString("XYZ", "not found")
	fmt.Printf("\n X = %s\n", x)
}
