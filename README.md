Para este desafio, você precisará criar o usecase de listagem das orders.
## Requisitos e Execução

### Ferramentas Necessárias

- **Go** 1.21 ou superior
- **Docker** e **Docker Compose**
- **WSL** ou **Linux**

### Configuração do Ambiente

1. Crie o arquivo `.env` no root (ajuste conforme necessário):

   ```bash
   echo "
   DB_DRIVER=mysql
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=root
   DB_PASSWORD=root
   DB_NAME=orders
   WEB_SERVER_PORT=8000
   GRPC_SERVER_PORT=50051
   GRAPHQL_SERVER_PORT=8080
   " > .env
   ```

2. Inicie toda a infraestrutura, execute as migrações e inicie o container da aplicação (tudo em um único comando):

   ```bash
   docker compose up -d
   ```

> **Observação:** O comando acima já executa as migrações do banco de dados e inicia o container da aplicação automaticamente. Não é necessário rodar comandos separados para migração ou inicialização manual da aplicação.


### Portas dos Serviços

- **REST API:** `8000`
- **gRPC:** `50051`
- **GraphQL:** `8080`
- **MySQL:** `3306`
- **RabbitMQ:** `5672` (AMQP), `15672` (UI)

### Exemplos de Requisições

#### REST

```http
GET http://localhost:8000/order
```

#### gRPC

Utilize um cliente gRPC para chamar o método `ListOrders` no endereço `localhost:50051`.

#### GraphQL

```graphql
query {
  listOrders {
   id
   customerName
   total
   status
  }
}
```
Endpoint: `http://localhost:8080/graphql`

---

Consulte o arquivo `api.http` para exemplos completos de requisições REST.