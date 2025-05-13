# Desafio
implementar listagem de ordens nos serviços
- [ ] Webserver http
- [ ] Endpoint GraphQL
- [ ] Query no gRPC

---

# 🧙‍♂️ Clean Architecture Challenge

Welcome to the Clean Architecture Challenge! This project demonstrates a layered architecture in Go, utilizing tools like Wire for dependency injection, and supports multiple interfaces: REST, gRPC, and GraphQL.

## 📦 Project Structure

```
fc_challenge_clean_arch/
├── cmd/
│   └── ordersystem/       # Main application entry point
├── internal/
│   ├── entity/            # Domain entities
│   ├── usecase/           # Business logic
│   ├── infra/             # Infrastructure (DB, web, gRPC)
│   ├── web/               # Web handlers
│   └── event/             # Event handling
├── pkg/                   # Shared packages
├── configs/               # Configuration files
├── go.mod                 # Go module definition
├── Makefile               # Build and run commands
└── README.md              # Project documentation
```

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Santosjordi/fc_challenge_clean_arch.git
cd fc_challenge_clean_arch
```

### 2. Configure the Application

Ensure you have a `.env` file or set the necessary environment variables as defined in `configs/config.go`.

### 3. Install Dependencies

```bash
go mod tidy
```

### 4. Generate Dependency Injection Code

This project uses [Google Wire](https://github.com/google/wire) for dependency injection. To generate the necessary code:

```bash
cd cmd/ordersystem
wire
cd ../..
```

> **Note:** Always run `wire` after modifying any constructor functions or provider sets.

### 5. Build and Run the Application

Use the provided `Makefile` for common tasks:

```bash
make run
```

This command compiles and runs all necessary files in the `cmd/ordersystem` directory.

> **Important:** Avoid running `go run main.go` directly, as it won't include other essential files like `wire_gen.go`. Always use `go run .` or `make run`.

### 6. Run Tests

```bash
make test
```

## 🛠️ Makefile Commands

* `make run` – Runs the application.
* `make wire` – Generates dependency injection code.
* `make build` – Builds the application binary.
* `make clean` – Cleans up generated files and binaries.
* `make test` – Runs all tests.

## 🧪 Available Interfaces

* **REST API:** Accessible at `http://localhost:<WebServerPort>/order`
* **gRPC:** Runs on port `<GRPCServerPort>`
* **GraphQL Playground:** Accessible at `http://localhost:<GraphQLServerPort>/`

Replace `<WebServerPort>`, `<GRPCServerPort>`, and `<GraphQLServerPort>` with the actual ports defined in your configuration.

## 🐛 Troubleshooting

* **Undefined functions like `InitializeCreateOrderUseCase`:** Ensure you've run `wire` to generate the necessary code.
* **Errors when running `go run main.go`:** Use `go run .` or `make run` instead to include all required files.

---
