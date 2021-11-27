FROM golang:1.17 as builder

WORKDIR /build

ADD ./go.mod /build/go.mod
# ADD ./go.sum /build/go.sum
# RUN go mod download
# RUN go mod verify

COPY main.go main.go
# COPY internal/ internal/
COPY script/ script/

RUN script/build -o hello

FROM alpine

LABEL maintainer="Rob Herley <robherley13@gmail.com>"

RUN apk --update --no-cache add bash git openssh ca-certificates
RUN update-ca-certificates

COPY --from=builder --chown=1001:1001 /build/hello /usr/local/bin/hello

RUN adduser -Du 1001 hello-user
USER hello-user

WORKDIR /usr/src/hello

ENTRYPOINT ["/usr/local/bin/hello"]