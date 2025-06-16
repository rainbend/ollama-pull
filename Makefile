VERSION ?= latest
OUT_DIR = bin
BINARY = ollama-pull

OS = $(shell uname)

GO = go
GO_PATH = $$($(GO) env GOPATH)
GO_BUILD = $(GO) build
GO_GET = $(GO) get
GO_CLEAN = $(GO) clean
GO_TEST = $(GO) test
GO_INSTALL = $(GO) install
GO_BUILD_FLAGS = -v

PLATFORMS := windows linux darwin

os = $(word 1, $@)
ARCH = amd64

.PHONY: clean
clean:
	$(GO_CLEAN) ./...
	-rm -rf bin

.PHONE: test
test: clean
	$(GO_TEST) ./...

.PHONE: build
build: clean
	$(GO_BUILD) $(GO_BUILD_FLAGS) -ldflags "$(GO_BUILD_LDFLAGS)" -o $(OUT_DIR)/$(BINARY) main.go

.PHONE: build-all
build-all: windows linux darwin

.PHONY: $(PLATFORMS)
$(PLATFORMS):
	mkdir -p $(OUT_DIR)
	GOOS=$(os) GOARCH=$(ARCH) $(GO_BUILD) $(GO_BUILD_FLAGS) -ldflags "$(GO_BUILD_LDFLAGS)" -o $(OUT_DIR)/$(BINARY)-$(VERSION)-$(os)-$(ARCH) main.go
