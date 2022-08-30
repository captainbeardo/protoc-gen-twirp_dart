//
// Code generated by protoc-gen-twirp_dart. DO NOT EDIT.
// Generated from: haberdasher/haberdasher.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name
import 'dart:async';
import 'package:http/http.dart';
import 'package:protobuf/protobuf.dart';
import 'dart:convert';
import './haberdasher.pb.dart';
import '../pinger/ping.pb.dart';

const _protobufContentType = 'application/protobuf';

abstract class Haberdasher {
	Future<Hat>makeHat(Size size);
	Future<PingResponse>ping(PingRequest pingRequest);
	Future<PingResponse>invalidArg(PingRequest pingRequest);
}

class HaberdasherProtobufClient implements Haberdasher {
	final String hostname;
	final String pathPrefix;

  HaberdasherProtobufClient(this.hostname, {this.pathPrefix = '/twirp'}) {}

	Future<T> _makeRequest<T,	RT extends GeneratedMessage>(String path, RT request,
		T Function(List<int>) builder) async {
		final url = "$hostname$pathPrefix$path";
		final uri = Uri.parse(url);
		final body = request.writeToBuffer();
		final headers = {
			'Content-Type': _protobufContentType,
			'Content-Length': body.length.toString()
		};

		final response = await post(uri, headers: headers, body: body);

		if (response.statusCode != 200) {
			throw decodeException(response);
		}
		return builder(response.bodyBytes);
	}

	@override
	Future<Hat> makeHat(Size size) async {
		return _makeRequest("/haberdasher.Haberdasher/MakeHat", size,
				(b) => Hat.fromBuffer(b));
	}

	@override
	Future<PingResponse> ping(PingRequest pingRequest) async {
		return _makeRequest("/haberdasher.Haberdasher/Ping", pingRequest,
				(b) => PingResponse.fromBuffer(b));
	}

	@override
	Future<PingResponse> invalidArg(PingRequest pingRequest) async {
		return _makeRequest("/haberdasher.Haberdasher/InvalidArg", pingRequest,
				(b) => PingResponse.fromBuffer(b));
	}
}

Exception decodeException(Response response) {
	try {
		final value = json.decode(response.body);
		return TwirpException.fromJson(value);
	} catch (e) {
		return TwirpException("unknown", response.body, e);
	}
}

class TwirpException implements Exception {
  final String code;
  final String msg;
  final dynamic meta;

  TwirpException(this.code, this.msg, this.meta);

  factory TwirpException.fromJson(Map<String, dynamic> json) {
    return TwirpException(
        json['code'] as String, json['msg'] as String, json['meta']);
  }

  @override
  String toString() {
    return 'TwirpException{code: $code, msg: $msg, meta: $meta}';
  }
}