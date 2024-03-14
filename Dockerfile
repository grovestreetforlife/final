FROM golang:1.22

WORKDIR /app

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main parcel.go

CMD ["/main"]