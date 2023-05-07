FROM golang:1.20.4-bullseye AS builder

WORKDIR /app

COPY . .

RUN go build -o /rocks

FROM scratch

COPY --from=builder /rocks .

CMD ["/rocks"]
