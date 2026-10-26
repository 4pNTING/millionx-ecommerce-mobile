import 'package:flutter_test/flutter_test.dart';
import 'package:millionx_ecommerce_frontend/core/network/graphql_api_client.dart';
import 'package:millionx_ecommerce_frontend/features/category/data/datasources/category_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/product/data/datasources/product_remote_data_source.dart';
import 'package:millionx_ecommerce_frontend/features/product/data/models/product_model.dart';

void main() {
  test('categories load all levels without per-parent requests', () async {
    final gateway = _Gateway({
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
    });
    final categories = await CategoryRemoteDataSource(gateway).getCategories();
    expect(categories.length, 2);
    expect(categories.last.parentId, 'root');
    expect(gateway.calls, 1);
    expect(gateway.variables['input'], {
      'fetchAll': true,
      'isActive': 'active',
      'rootOnly': false,
    });
  });
  test('products send pagination, currency and optional category', () async {
    final gateway = _Gateway({
      'products': {'items': [], 'total': 30, 'page': 2, 'limit': 12},
    });
    final page = await ProductRemoteDataSource(
      gateway,
    ).getProducts((keyword: 'phone', categoryId: 'category-1', page: 2));
    expect(page.pageCount, 3);
    expect(gateway.variables['input'], {
      'keyword': 'phone',
      'categoryId': 'category-1',
      'includeDescendants': true,
      'currency': 'LAK',
      'page': 2,
      'limit': 12,
      'isActive': 'active',
    });
  });
  test('all-category filter omits categoryId', () async {
    final gateway = _Gateway({
      'products': {'items': [], 'total': 0, 'page': 1, 'limit': 12},
    });
    await ProductRemoteDataSource(
      gateway,
    ).getProducts((keyword: '', categoryId: null, page: 1));
    expect(
      (gateway.variables['input'] as Map).containsKey('categoryId'),
      false,
    );
  });
  test('product maps real attributes and ignores inactive prices', () {
    final product = ProductModel.fromJson({
      'id': 'product-1',
      'name': 'Phone',
      'slug': 'phone',
      'variants': [
        {
          'id': 'variant-1',
          'sku': 'PHONE-BLACK',
          'isActive': true,
          'attributesJson': '{"color":"black","storage":256}',
          'prices': [
            {
              'id': 'price-old',
              'currency': 'LAK',
              'amount': 100,
              'isActive': false,
            },
            {
              'id': 'price-new',
              'currency': 'LAK',
              'amount': 200,
              'isActive': true,
            },
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
    });
    expect(product.variants.single.attributes, {
      'color': 'black',
      'storage': '256',
    });
    expect(product.startingPrice!.amount, 200);
    expect(product.images.single.altText, 'Black phone');
  });
  test('customer profile uses bearer token, never staff login', () async {
    final gateway = _Gateway({
      'myCustomerProfile': {
        'id': 'customer-1',
        'email': 'customer@example.com',
      },
    });
    final profile = await CustomerRemoteDataSource(
      gateway,
    ).getProfile('customer-access');
    expect(profile.id, 'customer-1');
    expect(gateway.accessToken, 'customer-access');
  });
}

class _Gateway implements GraphQlGateway {
  _Gateway(this.response);
  final Map<String, dynamic> response;
  Map<String, dynamic> variables = {};
  String? accessToken;
  int calls = 0;
  @override
  Future<Map<String, dynamic>> execute({
    required String document,
    Map<String, dynamic> variables = const {},
    String? accessToken,
  }) async {
    calls++;
    this.variables = variables;
    this.accessToken = accessToken;
    return response;
  }
}
