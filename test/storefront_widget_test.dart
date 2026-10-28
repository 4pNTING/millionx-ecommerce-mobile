import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionx_ecommerce_frontend/app/app.dart';
import 'package:millionx_ecommerce_frontend/app/app_router.dart';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/core/network/network_providers.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/models/auth_session_model.dart';
import 'package:millionx_ecommerce_frontend/features/auth/presentation/auth_providers.dart';

import 'package:millionx_ecommerce_frontend/features/home/presentation/storefront_screen.dart';

void main() {
  testWidgets('anonymous customer can browse and open a product', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [
        authLocalDataSourceProvider.overrideWithValue(_Local()),
        graphQlGatewayProvider.overrideWithValue(_CatalogGateway()),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: StorefrontScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Phone from backend'), findsOneWidget);
    expect(find.text('200 LAK'), findsOneWidget);
  });
  testWidgets('account requires customer login while catalog stays public', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [
        authLocalDataSourceProvider.overrideWithValue(_Local()),
        graphQlGatewayProvider.overrideWithValue(_CatalogGateway()),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MillionXApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();
    container.read(routerProvider).go('/account');
    await tester.pumpAndSettle();
    expect(find.text('Login / Sign up'), findsOneWidget);
    expect(find.text('Phone / Email /Username'), findsOneWidget);
  });
}

class _Local implements AuthLocalDataSource {
  @override
  Future<void> clearSession() async {}
  @override
  Future<AuthSessionModel?> readSession() async => null;
  @override
  Future<void> writeSession(AuthSessionModel session) async {}
}

class _CatalogGateway implements GraphQlGateway {
  final Map<String, dynamic> product = {
    'id': 'product-1',
    'name': 'Phone from backend',
    'slug': 'phone',
    'variants': [
      {
        'id': 'variant-1',
        'sku': 'PHONE',
        'isActive': true,
        'attributesJson': '{"color":"black"}',
        'prices': [
          {'id': 'price-1', 'currency': 'LAK', 'amount': 200, 'isActive': true},
        ],
      },
    ],
    'images': [],
  };
  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    if (document.contains('StoreCategories')) {
      return {
        'categories': {'items': []},
      };
    }
    if (document.contains('StoreProducts') || document.contains('Products')) {
      return {
        'products': {
          'items': [product],
          'total': 1,
          'page': 1,
          'limit': 20,
        },
      };
    }
    return {'product': product};
  }
}
