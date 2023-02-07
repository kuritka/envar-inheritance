package main

import (
	"context"
	"fmt"
	"os/exec"
)

// envar-inheritance-CALLER
func main() {
	output, cmdErr := exec.CommandContext(context.TODO(), "./envar-inheritance-printer", []string{}...).CombinedOutput()
	if cmdErr != nil {
		fmt.Println("ERROR:", cmdErr.Error())
	}
	fmt.Println("OUTPUT:", string(output))
}
