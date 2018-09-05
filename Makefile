ALPINE_VERSION ?= 3.8
GRPC_GATEWAY_VERSION ?= 1.4.1
GRPC_JAVA_VERSION ?= 1.14.0
GRPC_RUST_VERSION ?= 0.5.0
GRPC_SWIFT_VERSION ?= 0.4.1
GRPC_VERSION ?= 1.14.2
PROTOBUF_C_VERSION ?= 1.3.1
PROTOC_GEN_DOC_VERSION ?= 1.1.0
PROTOC_GEN_GOGOTTN_VERSION ?= 3.0.8
PROTOC_GEN_LINT_VERSION ?= 0.2.1
RUST_PROTOBUF_VERSION ?= 2.0.4
RUST_VERSION ?= 1.28.0
SWIFT_VERSION ?= 4.1.3
UBUNTU_VERSION ?= 18.04

IMAGE_NAME ?= thethingsindustries/protoc
TAG ?= latest

all: build

build:
	docker build \
	--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
	--build-arg GRPC_GATEWAY_VERSION=$(GRPC_GATEWAY_VERSION) \
	--build-arg GRPC_JAVA_VERSION=$(GRPC_JAVA_VERSION) \
	--build-arg GRPC_RUST_VERSION=$(GRPC_RUST_VERSION) \
	--build-arg GRPC_SWIFT_VERSION=$(GRPC_SWIFT_VERSION) \
	--build-arg GRPC_VERSION=$(GRPC_VERSION) \
	--build-arg PROTOBUF_C_VERSION=$(PROTOBUF_C_VERSION) \
	--build-arg PROTOC_GEN_DOC_VERSION=$(PROTOC_GEN_DOC_VERSION) \
	--build-arg PROTOC_GEN_GOGOTTN_VERSION=$(PROTOC_GEN_GOGOTTN_VERSION) \
	--build-arg PROTOC_GEN_LINT_VERSION=$(PROTOC_GEN_LINT_VERSION) \
	--build-arg RUST_PROTOBUF_VERSION=$(RUST_PROTOBUF_VERSION) \
	--build-arg RUST_VERSION=$(RUST_VERSION) \
	--build-arg SWIFT_VERSION=$(SWIFT_VERSION) \
	-t $(IMAGE_NAME):$(TAG) .

push: build
	docker push $(IMAGE_NAME):$(TAG)

clean:
	rm -rf build

.PHONY: all deps build push clean
