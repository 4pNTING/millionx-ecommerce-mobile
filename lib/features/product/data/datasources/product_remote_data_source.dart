import '../../../../core/domain/page_result.dart';
import '../../../../core/network/graphql_api_client.dart';
import '../../domain/product.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._gateway);
  final GraphQlGateway _gateway;
  static const fields = '''
    _id name slug description brand categoryId
    variants { _id sku name attributesJson isActive prices { _id currency amount compareAtAmount isActive } }
    images { _id variantId url altText sortOrder }
  ''';
  static const listDocument =
      'query Products(\$input: LoadProductDto) { products(input: \$input) { total page limit items { $fields } } }';
  static const detailDocument =
      'query StoreProduct(\$_id: String, \$slug: String, \$currency: String) { product(_id: \$_id, slug: \$slug, currency: \$currency) { $fields } }';

  Future<PageResult<Product>> getProducts(
    ProductFilter filter, {
    int limit = 20,
    String currency = 'LAK',
  }) async {
    final data = await _gateway.execute(
      document: listDocument,
      variables: {
        'input': {
          if (filter.keyword.trim().isNotEmpty) 'keyword': filter.keyword.trim(),
          if (filter.categoryId != null && filter.categoryId!.isNotEmpty) ...{
            'categoryId': filter.categoryId,
            'includeDescendants': true,
          },
          'currency': currency,
          'page': filter.page,
          'limit': limit,
          'isActive': ProductActiveStatus.active.value,
        },
      },
    );
    final page = (data['products'] as Map<String, dynamic>?) ?? {};
    final rawItems = (page['items'] as List?) ?? [];
    return PageResult(
      items: rawItems
          .map<Product>((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: (page['total'] as num?)?.toInt() ?? 0,
      page: (page['page'] as num?)?.toInt() ?? filter.page,
      limit: (page['limit'] as num?)?.toInt() ?? limit,
    );
  }

  Future<Product> getProduct(String id) async {
    final data = await _gateway.execute(
      document: detailDocument,
      variables: {'_id': id, 'currency': 'LAK'},
    );
    return ProductModel.fromJson(data['product'] as Map<String, dynamic>);
  }
}
