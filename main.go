package main

import (
	"github.com/apptreesoftware/protoc-gen-twirp_dart/generator"
	"google.golang.org/protobuf/compiler/protogen"
	"google.golang.org/protobuf/types/pluginpb"
)

func main() {
	protogen.Options{}.Run(func(p *protogen.Plugin) error {
		p.SupportedFeatures = uint64(pluginpb.CodeGeneratorResponse_FEATURE_PROTO3_OPTIONAL)
		for _, f := range p.Files {
			if !f.Generate {
				continue
			}
			// skip google/protobuf/timestamp, we don't do any special serialization for jsonpb.
			if f.Proto.GetName() == "google/protobuf/timestamp.proto" {
				continue
			}
			err := generator.CreateClientAPI(p, f)
			if err != nil {
				return err
			}
		}
		return nil
	})
}
