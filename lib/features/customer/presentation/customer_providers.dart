import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/network_providers.dart';
import '../data/datasources/customer_remote_data_source.dart';
import '../data/repositories/customer_repository_impl.dart';
import '../domain/customer_profile.dart';
import '../domain/usecases/get_customer_profile.dart';

final customerProfileProvider = FutureProvider.autoDispose
    .family<CustomerProfile, String>((ref, accessToken) {
      final repository = CustomerRepositoryImpl(
        CustomerRemoteDataSource(ref.watch(graphQlGatewayProvider)),
      );
      return GetCustomerProfile(repository)(accessToken);
    });
