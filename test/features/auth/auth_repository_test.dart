import 'package:flutter_test/flutter_test.dart';
import 'package:millionx_ecommerce_frontend/features/auth/domain/customer_registration.dart';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/models/auth_session_model.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/repositories/auth_repository_impl.dart';

void main() {
  const session = AuthSessionModel(
    accountId: 'account-1',
    customerId: 'customer-1',
    email: 'customer@example.com',
    token: 'access-token',
    refreshToken: 'refresh-token',
  );

  test('login persists the session returned by the backend', () async {
    final local = _FakeLocal();
    final remote = _FakeRemote(session: session);
    final repository = AuthRepositoryImpl(remote, local);

    final result = await repository.login(
      identifier: 'customer@example.com',
      password: 'example-password',
    );

    expect(result.customerId, 'customer-1');
    expect(remote.identifier, 'customer@example.com');
    expect(local.saved?.token, 'access-token');
  });

  test('restore refreshes stored session', () async {
    final local = _FakeLocal()..saved = session;
    final remote = _FakeRemote(session: session);
    final repository = AuthRepositoryImpl(remote, local);

    final result = await repository.restoreSession();

    expect(result?.customerId, session.customerId);
    expect(remote.refreshToken, 'refresh-token');
  });

  test('network outage preserves stored session for retry', () async {
    final local = _FakeLocal()..saved = session;
    final remote = _FakeRemote(
      session: session,
      refreshError: const GraphQlConnectionException('offline'),
    );
    final repository = AuthRepositoryImpl(remote, local);

    await expectLater(
      repository.restoreSession(),
      throwsA(isA<GraphQlConnectionException>()),
    );
    expect(local.saved?.refreshToken, 'refresh-token');
  });

  test('rejected refresh token removes stored session', () async {
    final local = _FakeLocal()..saved = session;
    final remote = _FakeRemote(
      session: session,
      refreshError: const GraphQlApiException('Invalid refresh token'),
    );
    final repository = AuthRepositoryImpl(remote, local);

    expect(await repository.restoreSession(), isNull);
    expect(local.saved, isNull);
  });

  test('logout removes the saved session', () async {
    final local = _FakeLocal()..saved = session;
    final repository = AuthRepositoryImpl(_FakeRemote(session: session), local);

    await repository.logout();

    expect(local.saved, isNull);
  });
}

class _FakeLocal implements AuthLocalDataSource {
  AuthSessionModel? saved;

  @override
  Future<void> clearSession() async => saved = null;

  @override
  Future<AuthSessionModel?> readSession() async => saved;

  @override
  Future<void> writeSession(AuthSessionModel session) async => saved = session;
}

class _FakeRemote implements AuthRemoteDataSource {
  _FakeRemote({required this.session, this.refreshError});

  final AuthSessionModel session;
  final Object? refreshError;
  String? identifier;
  String? refreshToken;

  @override
  Future<AuthSessionModel> register(CustomerRegistration input) async =>
      session;

  @override
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  }) async {
    this.identifier = identifier;
    return session;
  }

  @override
  Future<AuthSessionModel> refresh(String refreshToken) async {
    this.refreshToken = refreshToken;
    if (refreshError != null) throw refreshError!;
    return session;
  }
}
