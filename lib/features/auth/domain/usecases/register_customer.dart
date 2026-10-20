import '../auth_repository.dart';
import '../auth_session.dart';
import '../customer_registration.dart';

class RegisterCustomer {
  const RegisterCustomer(this.repository);
  final AuthRepository repository;
  Future<AuthSession> call(CustomerRegistration input) =>
      repository.register(input);
}
