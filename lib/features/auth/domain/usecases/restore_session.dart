import '../auth_repository.dart';
import '../auth_session.dart';

class RestoreSession {
  const RestoreSession(this._repository);
  final AuthRepository _repository;

  Future<AuthSession?> call() => _repository.restoreSession();
}
