BINARY := protoc-gen-twirp_dart

TIMESTAMP := $(shell date -u "+%Y-%m-%dT%H:%M:%SZ")
COMMIT := $(shell git rev-parse --short HEAD)
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

LDFLAGS := -ldflags "-X main.Timestamp=${TIMESTAMP} -X main.Commit=${COMMIT} -X main.Branch=${BRANCH}"

all: clean test install

install:
	go install ${LDFLAGS} github.com/captainbeardo/protoc-gen-twirp_dart

test:
	go test -v ./...

lint:
	go list ./... | grep -v /vendor/ | xargs -L1 golint -set_exit_status

run: install
	mkdir -p example/dart_client && \
	protoc --proto_path=./example/proto  --dart_out=./example/dart_client --twirp_dart_out=package_name=haberdasher:./example/dart_client ./example/proto/haberdasher/haberdasher.proto ./example/proto/pinger/ping.proto

example_proto: install
	mkdir -p example/dart_client/rpc && mkdir -p example/go_server/rpc && \
	protoc --proto_path=./example/proto  --go_out=paths=source_relative:example/go_server/rpc --twirp_out=paths=source_relative:example/go_server/rpc ./example/proto/haberdasher/haberdasher.proto && \
	protoc --proto_path=./example/proto  --go_out=paths=source_relative:example/go_server/rpc --twirp_out=paths=source_relative:example/go_server/rpc	./example/proto/pinger/ping.proto && \
	protoc --proto_path=./example/proto  --dart_out=./example/dart_client/rpc --twirp_dart_out=package_name=haberdasher:./example/dart_client/rpc ./example/proto/haberdasher/haberdasher.proto ./example/proto/pinger/ping.proto


build_linux:
	GOOS=linux GOARCH=amd64 go build -o ${BINARY} ${LDFLAGS} github.com/captainbeardo/protoc-gen-twirp_dart

clean:
	-rm -f ${GOPATH}/bin/${BINARY}
