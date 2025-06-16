FROM ubuntu:20.04 as build

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /go/src/github.com/rainbend/ollama-pull

COPY go.mod go.sum ./
RUN curl -fsSL https://golang.org/dl/go$(awk '/^go/ { print $2 }' go.mod).linux-$(case $(uname -m) in x86_64) echo amd64 ;; aarch64) echo arm64 ;; esac).tar.gz | tar xz -C /usr/local
ENV PATH=/usr/local/go/bin:$PATH
RUN go mod download
COPY . .
ARG GOFLAGS="'-ldflags=-w -s'"
ENV CGO_ENABLED=1
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -trimpath -buildmode=pie -o /bin/ollama-pull main.go

FROM ubuntu:20.04

COPY --from=build /workspace/bin/ollama-pull /usr/bin/

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*
