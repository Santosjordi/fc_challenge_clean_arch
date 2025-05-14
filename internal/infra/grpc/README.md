
To create the ListOrders service in gRPC, I've used the use case I've created during the webserver implementation;

from there, I updated the order.proto file with the message structure for a list of orders and the ran:

```bash
--go_out=. \
--go-grpc_out=. \
internal/infra/grpc/protofiles/order.proto
```

to generate the files, then I implemented the list orders service by updating the OrderService with some new dependencies and logic to hydrate the struct.

after that I updated wire with a new use case and generated the file `wire_gen.go` now gRPC works