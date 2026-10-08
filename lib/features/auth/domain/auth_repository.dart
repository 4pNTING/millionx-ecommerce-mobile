import 'auth_session.dart';
import 'customer_registration.dart';

abstract interface class AuthRepository {
  Future<AuthSession> register(CustomerRegistration input);
  Future<AuthSession> login({
    required String identifier,
    required String password,
  });

  Future<AuthSession?> restoreSession();
  Future<void> logout();
}
