import '../customer_profile.dart';
import '../customer_repository.dart';

class GetCustomerProfile {
  const GetCustomerProfile(this.repository);
  final CustomerRepository repository;
  Future<CustomerProfile> call(String accessToken) =>
      repository.getProfile(accessToken);
}
