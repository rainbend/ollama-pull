package main

import (
	"log/slog"

	"github.com/rainbend/ollama-pull/cmd"
)

func main() {
	if err := cmd.Execute(); err != nil {
		slog.Error("failed to execute command", "error", err)
	}
}
