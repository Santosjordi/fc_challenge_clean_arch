Para este desafio, você precisará criar o usecase de listagem das orders.
Esta listagem precisa ser feita com:
- [X] Endpoint REST (GET /order)
- [x] Service ListOrders com GRPC
- [x] Query ListOrders GraphQL

- [x] Não esqueça de criar as migrações necessárias.
- [X] arquivo api.http com a request para criar e listar as orders.

- [X] Para a criação do banco de dados, utilize o Docker (Dockerfile / docker-compose.yaml), com isso ao rodar o comando docker compose up tudo deverá subir, preparando o banco de dados.
- [X] Inclua um README.md com os passos a serem executados no desafio e a porta em que a aplicação deverá responder em cada serviço.

---

# Project Setup

1. Install required tools:
   - Go 1.21 or later
   - Docker and Docker Compose
   - Protocol Buffers compiler (protoc)

2. Create the `.env` file in `cmd/ordersystem/` with the following content:
```env
DB_DRIVER=mysql
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=root
DB_NAME=orders
WEB_SERVER_PORT=8000
GRPC_SERVER_PORT=50051
GRAPHQL_SERVER_PORT=8080
```

3. Start the infrastructure:
```bash
docker compose up -d
```

4. Run database migrations:
```bash
migrate -path=internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" up
```

5. Run the application:
```bash
cd cmd/ordersystem
go run .
```

## Services Ports
- REST API: 8000
- gRPC: 50051
- GraphQL: 8080
- MySQL: 3306
- RabbitMQ: 5672 (AMQP), 15672 (Management UI)