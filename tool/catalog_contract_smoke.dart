// Contract checks without a Flutter engine or a live database.
import 'dart:convert';
import 'dart:io';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/features/category/data/datasources/category_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/product/data/datasources/product_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/auth/domain/customer_registration.dart';

Future<void> main(List<String> args) async {
  final gateway = _Gateway();
  final categories = await CategoryRemoteDataSource(gateway).getCategories();
  _check(
    categories.length == 2 && categories.last.parentId == categories.first.id,
    'category hierarchy',
  );
  final categoryFilter = gateway.variables['filter'] as Map;
  _check(
    categoryFilter['fetchAll'] == true && categoryFilter['rootOnly'] == false,
    'all category levels',
  );
  final remote = ProductRemoteDataSource(gateway);
  final page = await remote.getProducts((
    keyword: 'Phone',
    categoryId: 'root',
    page: 2,
  ));
  _check(
    page.total == 25 && page.page == 2 && page.pageCount == 3,
    'pagination metadata',
  );
  final filter = gateway.variables['filter'] as Map;
  _check(
    filter['limit'] == 12 &&
        filter['categoryId'] == 'root' &&
        filter['currency'] == 'LAK',
    'product filter',
  );
  await remote.getProducts((keyword: '', categoryId: null, page: 1));
  _check(
    !(gateway.variables['filter'] as Map).containsKey('categoryId'),
    'optional category omitted',
  );
  final product = await remote.getProduct('product-1');
  _check(
    product.variants.single.attributes['color'] == 'black',
    'variant attributes',
  );
  _check(product.startingPrice?.amount == 200, 'active price only');
  _check(
    product.images.single.variantId == 'variant-1' &&
        product.images.single.altText == 'Black phone',
    'variant image mapping',
  );
  final profile = await CustomerRemoteDataSource(
    gateway,
  ).getProfile('customer-access');
  _check(
    profile.id == 'customer-1' && gateway.accessToken == 'customer-access',
    'customer profile bearer token',
  );
  final auth = GraphQlAuthRemoteDataSource(gateway);
  await auth.register(
    const CustomerRegistration(
      firstName: ' Test ',
      lastName: '',
      email: ' customer@example.com ',
      password: 'test-only',
    ),
  );
  final input = gateway.variables['input'] as Map;
  _check(
    input['email'] == 'customer@example.com' &&
        !input.containsKey('phone') &&
        input['firstName'] == 'Test',
    'registration optional fields',
  );
  await auth.login(identifier: ' customer@example.com ', password: 'test-only');
  _check(
    (gateway.variables['input'] as Map)['identifier'] == 'customer@example.com',
    'customer login input',
  );
  await auth.refresh('refresh-token');
  _check(
    (gateway.variables['input'] as Map)['refreshToken'] == 'refresh-token',
    'refresh input',
  );
  if (args.contains('--documents')) {
    stdout.writeln(jsonEncode(gateway.documents.toSet().toList()));
  } else {
    stdout.writeln(
      'MillionX catalog/customer contracts: 12 checks passed (fixtures, not live backend)',
    );
  }
}

void _check(bool condition, String label) {
  if (!condition) throw StateError('Failed: $label');
}

class _Gateway implements GraphQlGateway {
  Map<String, dynamic> variables = {};
  String? accessToken;
  final documents = <String>[];
  final Map<String, dynamic> product = {
    'id': 'product-1',
    'name': 'Phone',
    'slug': 'phone',
    'variants': [
      {
        'id': 'variant-1',
        'sku': 'PHONE',
        'isActive': true,
        'attributesJson': '{"color":"black"}',
        'prices': [
          {'id': 'old', 'currency': 'LAK', 'amount': 100, 'isActive': false},
          {'id': 'current', 'currency': 'LAK', 'amount': 200, 'isActive': true},
        ],
      },
    ],
    'images': [
      {
        'id': 'image-1',
        'variantId': 'variant-1',
        'url': '/uploads/phone.png',
        'altText': 'Black phone',
      },
    ],
  };
  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    documents.add(document);
    this.variables = variables;
    this.accessToken = accessToken;
    if (document.contains('StoreCategories')) {
      return {
        'categories': {
          'items': [
            {
              'id': 'root',
              'name': 'Electronics',
              'slug': 'electronics',
              'parentId': null,
            },
            {
              'id': 'child',
              'name': 'Phones',
              'slug': 'phones',
              'parentId': 'root',
            },
          ],
        },
      };
    }
    if (document.contains('StoreProducts')) {
      return {
        'products': {
          'items': [product],
          'total': 25,
          'page': variables['filter']['page'],
          'limit': 12,
        },
      };
    }
    if (document.contains('StoreProduct')) return {'product': product};
    if (document.contains('myCustomerProfile')) {
      return {
        'myCustomerProfile': {
          'id': 'customer-1',
          'email': 'customer@example.com',
        },
      };
    }
    final key = document.contains('registerCustomer')
        ? 'registerCustomer'
        : document.contains('refreshCustomerToken')
        ? 'refreshCustomerToken'
        : 'loginCustomer';
    return {
      key: {
        'accountId': 'account-1',
        'customerId': 'customer-1',
        'token': 'access-token',
        'refreshToken': 'refresh-token',
      },
    };
  }
}
