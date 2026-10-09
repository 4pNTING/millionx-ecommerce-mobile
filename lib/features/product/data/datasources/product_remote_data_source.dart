import '../../../../core/domain/page_result.dart';
import '../../../../core/network/graphql_api_client.dart';
import '../../domain/product.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._gateway);
  final GraphQlGateway _gateway;
  static const fields = '''
    id name slug description brand
    variants { id sku name attributesJson isActive prices { id currency amount compareAtAmount isActive } }
    images { id variantId url altText sortOrder }
  ''';
  static const listDocument =
      'query StoreProducts(\$filter: ProductFilterInput) { products(filter: \$filter) { total page limit items { $fields } } }';
  static const detailDocument =
      'query StoreProduct(\$id: String, \$currency: String) { product(id: \$id, currency: \$currency) { $fields } }';

  Future<PageResult<Product>> getProducts(ProductFilter filter) async {
    final data = await _gateway.execute(
      document: listDocument,
      variables: {
        'filter': {
          'keyword': filter.keyword,
          if (filter.categoryId != null) 'categoryId': filter.categoryId,
          'currency': 'LAK',
          'page': filter.page,
          'limit': 12,
          'includeInactive': false,
        },
      },
    );
    final page = data['products'] as Map<String, dynamic>;
    return PageResult(
      items: (page['items'] as List)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: page['total'] as int,
      page: page['page'] as int,
      limit: page['limit'] as int,
    );
  }

  Future<Product> getProduct(String id) async {
    final data = await _gateway.execute(
      document: detailDocument,
      variables: {'id': id, 'currency': 'LAK'},
    );
    return ProductModel.fromJson(data['product'] as Map<String, dynamic>);
  }
}
