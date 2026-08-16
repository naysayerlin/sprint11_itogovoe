FROM golang:1.22

WORKDIR /usr/src/app/sprint11_itogovoe

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /itogovoe

CMD ["/itogovoe"]