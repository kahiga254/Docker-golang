FROM alpine:3.19

# Install necessary packages
RUN apk add --no-cache bash gcc musl-dev openssl go

# Set Go environment variables
ENV GOLANG_VERSION 1.23.5
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Download and install Go
RUN wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go$GOLANG_VERSION.linux-amd64.tar.gz \
    && rm go$GOLANG_VERSION.linux-amd64.tar.gz

WORKDIR /app

COPY . .

RUN go build -o main .

CMD ["/app/main"]
