PROTO_DIR=internal/infra/grpc/protofiles
PB_OUT_DIR=.

proto:
	protoc --go_out=$(PB_OUT_DIR) --go-grpc_out=$(PB_OUT_DIR) $(PROTO_DIR)/*.proto
