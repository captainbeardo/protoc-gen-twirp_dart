///
//  Generated code. Do not modify.
//  source: haberdasher/haberdasher.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import '../pinger/ping.pbjson.dart' as $0;

@$core.Deprecated('Use hatDescriptor instead')
const Hat$json = const {
  '1': 'Hat',
  '2': const [
    const {'1': 'size', '3': 1, '4': 1, '5': 5, '10': 'size'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Hat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hatDescriptor = $convert.base64Decode('CgNIYXQSEgoEc2l6ZRgBIAEoBVIEc2l6ZRIUCgVjb2xvchgCIAEoCVIFY29sb3ISEgoEbmFtZRgDIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use sizeDescriptor instead')
const Size$json = const {
  '1': 'Size',
  '2': const [
    const {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
  ],
};

/// Descriptor for `Size`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sizeDescriptor = $convert.base64Decode('CgRTaXplEhYKBmluY2hlcxgBIAEoBVIGaW5jaGVz');
const $core.Map<$core.String, $core.dynamic> HaberdasherServiceBase$json = const {
  '1': 'Haberdasher',
  '2': const [
    const {'1': 'MakeHat', '2': '.haberdasher.Size', '3': '.haberdasher.Hat'},
    const {'1': 'Ping', '2': '.pinger.PingRequest', '3': '.pinger.PingResponse'},
    const {'1': 'InvalidArg', '2': '.pinger.PingRequest', '3': '.pinger.PingResponse'},
  ],
};

@$core.Deprecated('Use haberdasherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> HaberdasherServiceBase$messageJson = const {
  '.haberdasher.Size': Size$json,
  '.haberdasher.Hat': Hat$json,
  '.pinger.PingRequest': $0.PingRequest$json,
  '.pinger.PingResponse': $0.PingResponse$json,
};

/// Descriptor for `Haberdasher`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List haberdasherServiceDescriptor = $convert.base64Decode('CgtIYWJlcmRhc2hlchIuCgdNYWtlSGF0EhEuaGFiZXJkYXNoZXIuU2l6ZRoQLmhhYmVyZGFzaGVyLkhhdBIxCgRQaW5nEhMucGluZ2VyLlBpbmdSZXF1ZXN0GhQucGluZ2VyLlBpbmdSZXNwb25zZRI3CgpJbnZhbGlkQXJnEhMucGluZ2VyLlBpbmdSZXF1ZXN0GhQucGluZ2VyLlBpbmdSZXNwb25zZQ==');
