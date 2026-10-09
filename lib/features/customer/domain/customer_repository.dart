import 'customer_profile.dart';

abstract interface class CustomerRepository {
  Future<CustomerProfile> getProfile(String accessToken);
}
