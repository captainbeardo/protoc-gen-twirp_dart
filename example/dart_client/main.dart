import 'dart:async';

import 'rpc/haberdasher/haberdasher.twirp.dart';
import 'rpc/haberdasher/haberdasher.pb.dart';
import 'rpc/pinger/ping.pb.dart';
import 'package:http/http.dart' as http;

Future main(List<String> args) async {
  final client = http.Client();
  final service =
      HaberdasherProtobufClient("http://localhost:9200", httpClient: client);

  try {
    final pr = await service.ping(PingRequest(name: "test client"));
    print(pr);
    final hat = await service.makeHat(Size(inches: 10));
    print(hat);

    final ia = await service.invalidArg(PingRequest(name: "test client"));
    print(ia);
  } on TwirpException catch (e) {
    print("twirp exception ${e.toString()}");
    print(e.code);
  } on Exception catch (e) {
    print("${e.toString()}");
  } catch (e) {
    print(e);
  }
}
