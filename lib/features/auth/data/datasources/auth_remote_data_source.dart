import '../../../../core/network/graphql_api_client.dart';
import '../models/auth_session_model.dart';
import '../../domain/customer_registration.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthSessionModel> register(CustomerRegistration input);
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  });

  Future<AuthSessionModel> refresh(String refreshToken);
}

class GraphQlAuthRemoteDataSource implements AuthRemoteDataSource {
  GraphQlAuthRemoteDataSource(this._gateway);
  final GraphQlGateway _gateway;

  static const _fields = 'accountId customerId email phone token refreshToken';

  @override
  Future<AuthSessionModel> register(CustomerRegistration input) async {
    final data = await _gateway.execute(
      document:
          'mutation RegisterCustomer(\$input: RegisterCustomerInput!) {'
          ' registerCustomer(input: \$input) { $_fields } }',
      variables: {
        'input': {
          'firstName': input.firstName.trim(),
          'lastName': input.lastName.trim(),
          if ((input.email ?? '').trim().isNotEmpty)
            'email': input.email!.trim(),
          if ((input.phone ?? '').trim().isNotEmpty)
            'phone': input.phone!.trim(),
          'password': input.password,
        },
      },
    );
    return _readSession(data, 'registerCustomer');
  }

  @override
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  }) async {
    final data = await _gateway.execute(
      document:
          'mutation LoginCustomer(\$input: CustomerLoginInput!) {'
          ' loginCustomer(input: \$input) { $_fields } }',
      variables: {
        'input': {'identifier': identifier.trim(), 'password': password},
      },
    );
    return _readSession(data, 'loginCustomer');
  }

  @override
  Future<AuthSessionModel> refresh(String refreshToken) async {
    final data = await _gateway.execute(
      document:
          'mutation RefreshCustomerToken(\$input: RefreshTokenInput!) {'
          ' refreshCustomerToken(input: \$input) { $_fields } }',
      variables: {
        'input': {'refreshToken': refreshToken},
      },
    );
    return _readSession(data, 'refreshCustomerToken');
  }

  AuthSessionModel _readSession(Map<String, dynamic> data, String operation) {
    final json = data[operation];
    if (json is! Map<String, dynamic>) {
      throw const GraphQlApiException('Customer login response is invalid');
    }
    try {
      return AuthSessionModel.fromJson(json);
    } on FormatException {
      throw const GraphQlApiException('Customer login response is incomplete');
    }
  }
}
