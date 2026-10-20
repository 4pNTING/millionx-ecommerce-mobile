import '../../../../core/network/graphql_api_client.dart';
import '../../domain/auth_repository.dart';
import '../../domain/auth_session.dart';
import '../../domain/customer_registration.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._local);

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  Future<AuthSession> register(CustomerRegistration input) async {
    final session = await _remote.register(input);
    await _local.writeSession(session);
    return session;
  }

  @override
  Future<AuthSession> login({
    required String identifier,
    required String password,
  }) async {
    final session = await _remote.login(
      identifier: identifier,
      password: password,
    );
    await _local.writeSession(session);
    return session;
  }

  @override
  Future<AuthSession> socialLogin({
    required String provider,
    required String token,
  }) async {
    final session = await _remote.socialLogin(
      provider: provider,
      token: token,
    );
    await _local.writeSession(session);
    return session;
  }

  @override
  Future<AuthSession?> restoreSession() async {
    try {
      final saved = await _local.readSession();
      if (saved == null) return null;
      final refreshed = await _remote.refresh(saved.refreshToken);
      await _local.writeSession(refreshed);
      return refreshed;
    } on GraphQlConnectionException {
      rethrow; // Keep saved credentials so the customer can retry later.
    } on GraphQlApiException {
      await _local.clearSession();
      return null;
    } on FormatException {
      await _local.clearSession();
      return null;
    }
  }

  @override
  Future<void> logout() => _local.clearSession();
}
