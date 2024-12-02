// /lib/core/http_client.dart
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  final http.Client _inner;

  HttpClient() : _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // Devolvemos un Future<StreamedResponse> que es lo que espera la clase BaseClient
    return _inner.send(request);
  }
}
