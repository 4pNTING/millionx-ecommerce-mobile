import '../../../core/domain/page_result.dart';
import 'product.dart';

abstract interface class ProductRepository {
  Future<PageResult<Product>> getProducts(ProductFilter filter);
  Future<Product> getProduct(String id);
}
