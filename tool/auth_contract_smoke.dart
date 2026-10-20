// Run with `dart run tool/auth_contract_smoke.dart` without a Flutter engine.
import 'dart:io';
import 'package:millionx_ecommerce_frontend/features/auth/domain/customer_registration.dart';

import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/models/auth_session_model.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/repositories/auth_repository_impl.dart';

Future<void> main() async {
  final gateway = _Gateway();
  final local = _Local();
  final repository = AuthRepositoryImpl(
    GraphQlAuthRemoteDataSource(gateway),
    local,
  );

  final loggedIn = await repository.login(
    identifier: 'customer@example.com',
    password: 'test-only',
  );
  _expect(loggedIn.customerId == 'customer-1', 'customer ID');
  _expect(gateway.lastDocument.contains('loginCustomer'), 'login mutation');
  _expect(local.session?.refreshToken == 'refresh-token', 'persisted token');

  final restored = await repository.restoreSession();
  _expect(restored?.customerId == 'customer-1', 'restored customer');
  _expect(
    gateway.lastDocument.contains('refreshCustomerToken'),
    'refresh mutation',
  );

  await repository.logout();
  _expect(local.session == null, 'logout clears session');
  final registered = await repository.register(
    const CustomerRegistration(
      firstName: 'Test',
      lastName: 'Customer',
      email: 'customer@example.com',
      password: 'test-only',
    ),
  );
  _expect(registered.customerId == 'customer-1', 'registered customer');
  _expect(
    gateway.lastDocument.contains('registerCustomer'),
    'registration mutation',
  );
  stdout.writeln('MillionX auth contract smoke passed');
}

void _expect(bool condition, String description) {
  if (!condition) throw StateError('Failed: $description');
}

class _Gateway implements GraphQlGateway {
  String lastDocument = '';

  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    lastDocument = document;
    final key = document.contains('refreshCustomerToken')
        ? 'refreshCustomerToken'
        : document.contains('registerCustomer')
        ? 'registerCustomer'
        : 'loginCustomer';
    return {
      key: {
        'accountId': 'account-1',
        'customerId': 'customer-1',
        'email': 'customer@example.com',
        'token': 'access-token',
        'refreshToken': 'refresh-token',
      },
    };
  }
}

class _Local implements AuthLocalDataSource {
  AuthSessionModel? session;

  @override
  Future<AuthSessionModel?> readSession() async => session;

  @override
  Future<void> writeSession(AuthSessionModel session) async {
    this.session = session;
  }

  @override
  Future<void> clearSession() async {
    session = null;
  }
}
