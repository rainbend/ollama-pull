//go:build !windows

// Copy https://github.com/ollama/ollama/blob/main/server/sparse_common.go

package image

import "os"

func setSparse(*os.File) {
}
