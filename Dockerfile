FROM golang:1.23.3-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -ldflags="-w -s" -o server ./cmd/ordersystem

# ---- Runtime Image ----
FROM alpine:3.18

RUN apk add --no-cache bash curl mysql-client busybox-extras wget

# Install migrate, is this a good idea? Database related stuff should be handled separately from the app?
RUN wget -O /tmp/migrate.tar.gz https://github.com/golang-migrate/migrate/releases/download/v4.17.0/migrate.linux-amd64.tar.gz && \
    tar -xzvf /tmp/migrate.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/migrate

WORKDIR /app

COPY --from=builder /app/server .
COPY .env .env
COPY internal/infra/database/migrations ./internal/infra/database/migrations

# Add the startup entrypoint logic -  wait for the services to be ready before starting the app
ENTRYPOINT ["/bin/sh", "-c", "\
  echo 'Waiting for MySQL...' && \
  until mysqladmin ping -h mysql -uroot -proot --silent; do sleep 1; done && \
  echo 'Waiting for RabbitMQ...' && \
  until nc -z rabbitmq 5672; do sleep 1; done && \
  echo 'RabbitMQ is ready!' && \
  echo 'Running migrations...' && \
  migrate -path=./internal/infra/database/migrations -database \"mysql://root:root@tcp(mysql:3306)/orders\" -verbose up && \
  echo 'Starting app...' && \
  ./server \
"]

