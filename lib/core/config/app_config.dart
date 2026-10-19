import 'package:flutter/foundation.dart';

abstract final class AppConfig {
  static const _configuredApiUrl = String.fromEnvironment('API_BASE_URL');

  static String imageUrl(String url) {
    final endpointUri = Uri.parse(graphQlEndpoint);
    final parsedUrl = Uri.tryParse(url);
    if (parsedUrl == null) return url;

    if (parsedUrl.host == 'localhost' ||
        parsedUrl.host == '127.0.0.1' ||
        parsedUrl.host == '10.0.2.2') {
      return parsedUrl
          .replace(
            scheme: endpointUri.scheme,
            host: endpointUri.host,
            port: endpointUri.hasPort ? endpointUri.port : null,
          )
          .toString();
    }

    if (!parsedUrl.hasScheme) {
      return endpointUri.resolve(url).toString();
    }

    return url;
  }

  static String get graphQlEndpoint {
    if (_configuredApiUrl.isNotEmpty) return _configuredApiUrl;

    if (kIsWeb) return 'http://localhost:3001/api-gateway';

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => 'http://10.0.2.2:3001/api-gateway',
      TargetPlatform.iOS => 'http://192.168.100.51:3001/api-gateway',
      _ => 'http://192.168.100.51:3001/api-gateway',
    };
  }

  static List<String> get fallbackGraphQlEndpoints {
    if (kIsWeb) return const ['http://127.0.0.1:3001/api-gateway'];

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => const [
        'http://10.0.2.2:3001/api-gateway',
      ],
      TargetPlatform.iOS => const [
        'http://localhost:3001/api-gateway',
        'http://127.0.0.1:3001/api-gateway',
        'http://192.168.100.51:3001/api-gateway',
      ],
      _ => const [
        'http://localhost:3001/api-gateway',
        'http://127.0.0.1:3001/api-gateway',
        'http://192.168.100.51:3001/api-gateway',
      ],
    };
  }
}
