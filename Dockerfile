FROM golang:alpine3.19 AS builder

RUN apk add --no-cache \
        git

WORKDIR /build
ENV CGO_ENABLED=0
RUN git clone \
      --depth 1 \
      --branch "v0.4.5"  \
      https://github.com/equinix-labs/otel-cli \
    && cd otel-cli \
    && go build -ldflags="-w -s" -o /otel-cli .


FROM alpine:latest
COPY --from=builder /otel-cli /otel-cli
ENTRYPOINT ["/otel-cli"]

