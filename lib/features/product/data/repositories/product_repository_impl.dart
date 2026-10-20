import '../../../../core/domain/page_result.dart';
import '../../domain/product.dart';
import '../../domain/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._remote);
  final ProductRemoteDataSource _remote;
  @override
  Future<PageResult<Product>> getProducts(ProductFilter filter) =>
      _remote.getProducts(filter);
  @override
  Future<Product> getProduct(String id) => _remote.getProduct(id);
}
