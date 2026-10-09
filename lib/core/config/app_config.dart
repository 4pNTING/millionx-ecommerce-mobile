import 'package:flutter/foundation.dart';

abstract final class AppConfig {
  static const _configuredApiUrl = String.fromEnvironment('API_BASE_URL');

  static String imageUrl(String url) =>
      Uri.parse(graphQlEndpoint).resolve(url).toString();

  static String get graphQlEndpoint {
    if (_configuredApiUrl.isNotEmpty) return _configuredApiUrl;

    if (kIsWeb) return 'http://localhost:3001/api-gateway';

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => 'http://10.0.2.2:3001/api-gateway',
      _ => 'http://localhost:3001/api-gateway',
    };
  }
}
