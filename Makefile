PROTO_DIR=internal/infra/grpc/protofiles
PB_OUT_DIR=.

proto:
	protoc --go_out=$(PB_OUT_DIR) --go-grpc_out=$(PB_OUT_DIR) $(PROTO_DIR)/*.proto

# Makefile for fc_challenge_clean_arch

# Change this if your main package is elsewhere
CMD_DIR=./cmd/ordersystem

.PHONY: run wire build clean test

## Run the application (all files in CMD_DIR)
run:
	go run $(CMD_DIR)

## Generate dependency injection code using Wire
wire:
	cd $(CMD_DIR) && wire

## Build the binary
build:
	go build -o bin/ordersystem $(CMD_DIR)

## Clean build cache and binaries
clean:
	go clean -cache
	rm -rf bin

## Run tests (you can filter by directory or tags)
test:
	go test ./...
