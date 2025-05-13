# Desafio
implementar listagem de ordens nos serviços
- [ ] Webserver http
- [ ] Endpoint GraphQL
- [ ] Query no gRPC

## Como Rodar
Subir os containeres com rabbitMQ e MySQL

```bash
docker compose up -d
```

criar um .env dentro de cmd/ordersystem

entrar na pasta cmd/ordersystem
```bash
cd cmd/ordersystem
go run .
```

