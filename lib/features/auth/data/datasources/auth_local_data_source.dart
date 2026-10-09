import '../models/auth_session_model.dart';

abstract interface class AuthLocalDataSource {
  Future<AuthSessionModel?> readSession();
  Future<void> writeSession(AuthSessionModel session);
  Future<void> clearSession();
}
