import 'package:flutter_test/flutter_test.dart';
import 'package:millionx_ecommerce_frontend/features/auth/domain/customer_registration.dart';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_remote_data_source.dart';

void main() {
  test('registration omits empty optional phone and trims email', () async {
    final gateway = _FakeGateway();
    final remote = GraphQlAuthRemoteDataSource(gateway);
    await remote.register(
      const CustomerRegistration(
        firstName: ' Test ',
        lastName: '',
        email: ' customer@example.com ',
        password: 'test-only',
      ),
    );
    expect(gateway.document, contains('RegisterCustomerDto!'));
    final input = gateway.variables!['input'] as Map;
    expect(input['email'], 'customer@example.com');
    expect(input.containsKey('phone'), false);
    expect(input['firstName'], 'Test');
  });
  test('customer login sends the exact MillionX mutation and input', () async {
    final gateway = _FakeGateway();
    final remote = GraphQlAuthRemoteDataSource(gateway);

    final session = await remote.login(
      identifier: ' customer@example.com ',
      password: 'secret-value',
    );

    expect(gateway.document, contains('loginCustomer(input: \$input)'));
    expect(gateway.document, contains('CustomerLoginDto!'));
    expect(gateway.variables, {
      'input': {
        'identifier': 'customer@example.com',
        'password': 'secret-value',
      },
    });
    expect(session.customerId, 'customer-1');
  });

  test('refresh sends stored refresh token', () async {
    final gateway = _FakeGateway();
    final remote = GraphQlAuthRemoteDataSource(gateway);

    await remote.refresh('refresh-token');

    expect(gateway.document, contains('refreshCustomerToken(input: \$input)'));
    expect(gateway.variables, {
      'input': {'refreshToken': 'refresh-token'},
    });
  });

  test('social login sends SocialLoginCustomer mutation for GOOGLE', () async {
    final gateway = _FakeGateway();
    final remote = GraphQlAuthRemoteDataSource(gateway);

    final session = await remote.socialLogin(
      provider: 'GOOGLE',
      token: 'google-id-token-xyz',
    );

    expect(gateway.document, contains('socialLoginCustomer(input: \$input)'));
    expect(gateway.document, contains('SocialLoginCustomerDto!'));
    expect(gateway.variables, {
      'input': {
        'provider': 'GOOGLE',
        'token': 'google-id-token-xyz',
      },
    });
    expect(session.customerId, 'customer-1');
  });

  test('social login sends SocialLoginCustomer mutation for FACEBOOK', () async {
    final gateway = _FakeGateway();
    final remote = GraphQlAuthRemoteDataSource(gateway);

    final session = await remote.socialLogin(
      provider: 'FACEBOOK',
      token: 'facebook-access-token-abc',
    );

    expect(gateway.document, contains('socialLoginCustomer(input: \$input)'));
    expect(gateway.document, contains('SocialLoginCustomerDto!'));
    expect(gateway.variables, {
      'input': {
        'provider': 'FACEBOOK',
        'token': 'facebook-access-token-abc',
      },
    });
    expect(session.customerId, 'customer-1');
  });
}

class _FakeGateway implements GraphQlGateway {
  String? document;
  Map<String, dynamic>? variables;

  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    this.document = document;
    this.variables = variables;
    return {
      document.contains('refreshCustomerToken')
          ? 'refreshCustomerToken'
          : document.contains('registerCustomer')
          ? 'registerCustomer'
          : document.contains('socialLoginCustomer')
          ? 'socialLoginCustomer'
          : 'loginCustomer': {
        'accountId': 'account-1',
        'customerId': 'customer-1',
        'email': 'customer@example.com',
        'phone': null,
        'token': 'access-token',
        'refreshToken': 'refresh-token',
      },
    };
  }
}
