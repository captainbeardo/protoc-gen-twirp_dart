///
//  Generated code. Do not modify.
//  source: pinger/ping.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = const {
  '1': 'PingRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor = $convert.base64Decode('CgtQaW5nUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');
@$core.Deprecated('Use pingResponseDescriptor instead')
const PingResponse$json = const {
  '1': 'PingResponse',
  '2': const [
    const {'1': 'answer', '3': 1, '4': 1, '5': 9, '10': 'answer'},
  ],
};

/// Descriptor for `PingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingResponseDescriptor = $convert.base64Decode('CgxQaW5nUmVzcG9uc2USFgoGYW5zd2VyGAEgASgJUgZhbnN3ZXI=');
const $core.Map<$core.String, $core.dynamic> PingerServiceBase$json = const {
  '1': 'Pinger',
  '2': const [
    const {'1': 'Ping', '2': '.pinger.PingRequest', '3': '.pinger.PingResponse'},
  ],
};

@$core.Deprecated('Use pingerServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PingerServiceBase$messageJson = const {
  '.pinger.PingRequest': PingRequest$json,
  '.pinger.PingResponse': PingResponse$json,
};

/// Descriptor for `Pinger`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List pingerServiceDescriptor = $convert.base64Decode('CgZQaW5nZXISMQoEUGluZxITLnBpbmdlci5QaW5nUmVxdWVzdBoULnBpbmdlci5QaW5nUmVzcG9uc2U=');
