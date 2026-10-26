import 'package:dio/dio.dart';

abstract interface class GraphQlGateway {
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables,
    String? accessToken,
  });
}

class GraphQlApiClient implements GraphQlGateway {
  GraphQlApiClient({
    required String endpoint,
    Dio? dio,
    this.fallbackEndpoints = const [],
  })  : _activeEndpoint = endpoint,
        _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: endpoint,
                connectTimeout: const Duration(seconds: 4),
                receiveTimeout: const Duration(seconds: 15),
                headers: const {'Content-Type': 'application/json'},
              ),
            );

  String _activeEndpoint;
  final List<String> fallbackEndpoints;
  final Dio _dio;

  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    final isMutation =
        RegExp(r'^\s*mutation\b', caseSensitive: false).hasMatch(document);

    // Mutations are non-idempotent and must not be automatically replayed on fallback endpoints
    final candidateEndpoints = isMutation
        ? [_activeEndpoint]
        : [
            _activeEndpoint,
            ...fallbackEndpoints.where((url) => url != _activeEndpoint),
          ];

    for (var i = 0; i < candidateEndpoints.length; i++) {
      final endpoint = candidateEndpoints[i];
      try {
        final response = await _dio.post<Map<String, dynamic>>(
          endpoint,
          data: {'query': document, 'variables': variables},
          options: Options(
            headers: accessToken == null || accessToken.isEmpty
                ? null
                : {'Authorization': 'Bearer $accessToken'},
          ),
        );

        final payload = response.data;
        if (payload == null) {
          throw const GraphQlApiException('Server returned an empty response');
        }

        final errors = payload['errors'];
        if (errors is List && errors.isNotEmpty) {
          final first = errors.first;
          final message = first is Map ? first['message']?.toString() : null;
          throw GraphQlApiException(message ?? 'Request failed');
        }

        final data = payload['data'];
        if (data is! Map<String, dynamic>) {
          throw const GraphQlApiException('Server returned invalid data');
        }

        if (_activeEndpoint != endpoint) {
          _activeEndpoint = endpoint;
          _dio.options.baseUrl = endpoint;
        }

        return data;
      } on GraphQlApiException {
        rethrow;
      } on DioException catch (error) {
        // If the server returned an HTTP response, it is an HTTP error rather than a connection failure
        if (error.response != null) {
          final response = error.response!;
          final statusCode = response.statusCode ?? 500;
          final body = response.data;
          String? message;

          if (body is Map) {
            if (body['message'] != null) {
              message = body['message'].toString();
            } else if (body['errors'] is List && (body['errors'] as List).isNotEmpty) {
              final first = (body['errors'] as List).first;
              if (first is Map && first['message'] != null) {
                message = first['message'].toString();
              }
            }
          }

          throw GraphQlHttpException(
            statusCode,
            message ?? 'HTTP $statusCode error from MillionX server',
          );
        }

        // Mutations must never be retried on another endpoint upon network timeout/failure
        if (isMutation) {
          throw const GraphQlConnectionException(
            'Cannot connect to MillionX. Check the backend and network.',
          );
        }

        // Connection timeout or network failure on query: try next fallback endpoint if available
        continue;
      }
    }

    throw const GraphQlConnectionException(
      'Cannot connect to MillionX. Check the backend and network.',
    );
  }
}

class GraphQlApiException implements Exception {
  const GraphQlApiException(this.message);
  final String message;

  @override
  String toString() => message;
}

class GraphQlHttpException extends GraphQlApiException {
  const GraphQlHttpException(this.statusCode, super.message);
  final int statusCode;

  @override
  String toString() => 'HTTP $statusCode: $message';
}

class GraphQlConnectionException implements Exception {
  const GraphQlConnectionException(this.message);
  final String message;

  @override
  String toString() => message;
}
