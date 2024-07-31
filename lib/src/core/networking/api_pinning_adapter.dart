import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class PinningHttpClientAdapter implements HttpClientAdapter {
  final List<String> allowedSHAFingerprints;
  final IOHttpClientAdapter _adapter = IOHttpClientAdapter();

  PinningHttpClientAdapter(this.allowedSHAFingerprints) {
    _adapter.createHttpClient = () => _createHttpClient();
  }

  HttpClient _createHttpClient() {
    HttpClient client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      final fingerprint = sha256.convert(cert.der).toString();
      return allowedSHAFingerprints.contains(fingerprint);
    };
    return client;
  }

  @override
  Future<ResponseBody> fetch(
      RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
