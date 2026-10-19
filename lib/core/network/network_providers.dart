import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import 'graphql_api_client.dart';

final graphQlGatewayProvider = Provider<GraphQlGateway>(
  (ref) => GraphQlApiClient(
    endpoint: AppConfig.graphQlEndpoint,
    fallbackEndpoints: AppConfig.fallbackGraphQlEndpoints,
  ),
);
