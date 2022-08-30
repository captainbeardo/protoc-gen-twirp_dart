package main

import (
	"context"
	"fmt"
	"log"
	"net/http"

	"github.com/captainbeardo/protoc-gen-twirp_dart/example/go_server/rpc/haberdasher"
	"github.com/captainbeardo/protoc-gen-twirp_dart/example/go_server/rpc/pinger"
	"github.com/twitchtv/twirp"
)

type haberdasherService struct{}

// MakeHat produces a hat
func (*haberdasherService) MakeHat(ctx context.Context, size *haberdasher.Size) (*haberdasher.Hat, error) {
	return &haberdasher.Hat{Size: size.GetInches(), Color: "green"}, nil
}

// Ping
func (*haberdasherService) Ping(ctx context.Context, req *pinger.PingRequest) (*pinger.PingResponse, error) {
	return &pinger.PingResponse{Answer: fmt.Sprintf("Hello %s", req.GetName())}, nil
}

func (*haberdasherService) InvalidArg(ctx context.Context, req *pinger.PingRequest) (*pinger.PingResponse, error) {
	return nil, twirp.InvalidArgumentError("request", "all arguments are invalid")
}

func main() {
	server := haberdasher.NewHaberdasherServer(&haberdasherService{})
	log.Fatal(http.ListenAndServe(":9200", server))
}
