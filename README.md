# Twirp Dart Plugin

A protoc plugin for generating a twirp client suitable for web and flutter/io projects. Inspired by the [Twirp typescript plugin](https://github.com/larrymyers/protoc-gen-twirp_typescript).

Based off the plugin [apptreesoftware/protoc-gen-twirp_dart](https://github.com/apptreesoftware/protoc-gen-twirp_dart) and modifications from [marwan-at-work/protoc-gen-twirp_dart](https://github.com/marwan-at-work/protoc-gen-twirp_dart). This plugin will output a protobuf based client instead of a JSON based client. It also removes some external dependencies.

## Setup

The protobuf v3 compiler is required. You can get the latest precompiled binary for your system here:

https://github.com/google/protobuf/releases

### Twirp Go Server (optional)

While not required for generating the client code, it is required to run the server component of the example.

    go install github.com/twitchtv/twirp/protoc-gen-twirp
    go install github.com/golang/protobuf/protoc-gen-go

### Dependencies

This plugin requires 2 Dart pub dependencies. In your pubspec.yaml specify:


    http: ^0.13.0
    protobuf: ^2.0.0

In order to build the dart protobuf clients you will also need [Dart protobuf generator](https://github.com/dart-lang/protobuf/tree/master/protoc_plugin#how-to-build-and-use)

## Usage

    go install github.com/apptreesoftware/protoc-gen-twirp_dart
    protoc --dart_out=./example/dart_client --twirp_dart_out=./example/dart_client ./example/proto/haberdasher

All generated files will be placed relative to the specified output directory for the plugin.
This is different behavior than the twirp Go plugin, which places the files relative to the input proto files.

This decision is intentional, since only client code is generated, and the destination is likely somewhere different
than the server code.

Using the Twirp hashberdasher proto:

```dart
import 'dart:async';

import 'haberdasher/haberdasher.twirp.dart';
import 'haberdasher/haberdasher.pb.dart';

Future main(List<String> args) async {
  final service = new HaberdasherProtobufClient('http://localhost:8080');
  try {
    final hat = await service.makeHat(Size(inches: 10));
    print(hat);
  } on TwirpJsonException catch (e) {
    print("${e.code} - ${e.message}");
  } catch (e) {
    print(e);
  }
}
```

### Parameters

The plugin parameters should be added in the same manner as other protoc plugins.
Key/value pairs separated by a single equal sign, and multiple parameters comma separated.

## Using the Example

Run the server:

    make example_proto
    go run example/go_server/main.go

In a new terminal run the client:

    cd example/dart_client
    pub get
    dart main.dart
