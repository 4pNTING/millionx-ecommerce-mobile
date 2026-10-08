import '../../../../core/network/graphql_api_client.dart';
import '../models/customer_profile_model.dart';

class CustomerRemoteDataSource {
  const CustomerRemoteDataSource(this.gateway);
  final GraphQlGateway gateway;
  Future<CustomerProfileModel> getProfile(String accessToken) async {
    final data = await gateway.execute(
      document:
          'query MyCustomerProfile { myCustomerProfile { id firstName lastName email phone } }',
      accessToken: accessToken,
    );
    return CustomerProfileModel.fromJson(
      data['myCustomerProfile'] as Map<String, dynamic>,
    );
  }
}
