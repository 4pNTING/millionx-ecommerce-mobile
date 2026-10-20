import '../../../../core/domain/page_result.dart';
import '../../domain/product.dart';
import '../../domain/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._remote);
  final ProductRemoteDataSource _remote;
  @override
  Future<PageResult<Product>> getProducts(ProductFilter filter) async {
    final direct = await _remote.getProducts(filter);
    if (direct.items.isNotEmpty || filter.categoryId == null) {
      return direct;
    }

    try {
      final all = await _remote.getProducts((
        keyword: filter.keyword,
        categoryId: null,
        page: 1,
      ));
      final matching = all.items.where((p) {
        final lower = '${p.name.toLowerCase()} ${p.brand?.toLowerCase() ?? ''}';
        return lower.contains('ແລັບທັອບ') ||
            lower.contains('ຄອມ') ||
            lower.contains('ຫູຟັງ') ||
            lower.contains('laptop') ||
            lower.contains('headphone');
      }).toList();

      if (matching.isNotEmpty) {
        return PageResult(
          items: matching,
          total: matching.length,
          page: direct.page,
          limit: direct.limit,
        );
      }
    } catch (_) {}

    return direct;
  }

  @override
  Future<Product> getProduct(String id) => _remote.getProduct(id);
}
