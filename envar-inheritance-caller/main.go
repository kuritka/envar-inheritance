package main

import (
	"context"
	"fmt"
	"os/exec"
	"time"
)

// envar-inheritance-CALLER
func main() {
	output, cmdErr := exec.CommandContext(context.TODO(), "./envar-inheritance-printer", []string{}...).CombinedOutput()
	if cmdErr != nil {
		fmt.Println("ERROR:", cmdErr.Error())
	}
	fmt.Println("OUTPUT:", string(output))
	time.Sleep(10 * time.Minute)
}
