.PHONY: setup build run

setup: mysql-ready go-mod-download migrate-db

mysql-ready:
	@echo "Waiting for MySQL to be ready..."
	docker exec mysql sh -c 'until mysql -hlocalhost -uroot -proot -e "SELECT 1"; do sleep 1; done'
	@echo "MySQL is ready!"

go-mod-download:
	go mod download

migrate-db:
	migrate -path=internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" up

# This doesn't work and I can't figure out why
build:
	mkdir -p bin
	cp cmd/ordersystem/.env bin/.env
	go build -o bin/ordersystem ./cmd/ordersystem/...

run: setup build
	./bin/ordersystem