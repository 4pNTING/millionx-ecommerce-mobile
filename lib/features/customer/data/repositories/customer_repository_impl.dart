import '../../domain/customer_profile.dart';
import '../../domain/customer_repository.dart';
import '../datasources/customer_remote_data_source.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  const CustomerRepositoryImpl(this.remote);
  final CustomerRemoteDataSource remote;
  @override
  Future<CustomerProfile> getProfile(String accessToken) =>
      remote.getProfile(accessToken);
}
