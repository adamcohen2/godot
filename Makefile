.PHONY: test
test:
	go test ./...

.PHONY: cover
cover:
	@ go test -coverprofile cover.out ./...
	@ go tool cover -html=cover.out -o cover.html
	@ rm -f cover.out

.PHONY: lint
lint:
	@ golangci-lint run

.PHONY: build
build:
	go build -o godot ./cmd/godot

.PHONY: release
release:
	goreleaser release --rm-dist
