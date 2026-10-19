import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';

class _MockAdapter implements HttpClientAdapter {
  final List<String> requestedUrls = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestedUrls.add(options.path);
    if (options.path.contains('192.168.100.46')) {
      throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionTimeout,
        error: 'Host unreachable',
      );
    }
    return ResponseBody.fromString(
      '{"data": {"status": "ok"}}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('falls back to reachable candidate endpoint if primary connection fails', () async {
    final adapter = _MockAdapter();
    final dio = Dio()..httpClientAdapter = adapter;

    final client = GraphQlApiClient(
      endpoint: 'http://192.168.100.46:3001/api-gateway',
      fallbackEndpoints: const [
        'http://localhost:3001/api-gateway',
        'http://192.168.100.51:3001/api-gateway',
      ],
      dio: dio,
    );

    final result = await client.execute(document: 'query { status }');
    expect(result, {'status': 'ok'});
    expect(adapter.requestedUrls, contains('http://192.168.100.46:3001/api-gateway'));
    expect(adapter.requestedUrls, contains('http://localhost:3001/api-gateway'));

    // Second call should reuse the active working endpoint directly
    await client.execute(document: 'query { status }');
    expect(adapter.requestedUrls.last, 'http://localhost:3001/api-gateway');
  });
}
