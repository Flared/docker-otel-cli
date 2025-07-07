.PHONY: build
build:
	docker build -t flared/otel-cli .

.PHONY: run
run: build
	docker run -it flared/otel-cli -h