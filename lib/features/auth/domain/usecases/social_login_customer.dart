import '../auth_repository.dart';
import '../auth_session.dart';

class SocialLoginCustomer {
  const SocialLoginCustomer(this._repository);
  final AuthRepository _repository;

  Future<AuthSession> call({
    required String provider,
    required String token,
  }) => _repository.socialLogin(provider: provider, token: token);
}
