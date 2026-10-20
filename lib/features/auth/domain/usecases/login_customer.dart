import '../auth_repository.dart';
import '../auth_session.dart';

class LoginCustomer {
  const LoginCustomer(this._repository);
  final AuthRepository _repository;

  Future<AuthSession> call({
    required String identifier,
    required String password,
  }) => _repository.login(identifier: identifier, password: password);
}
