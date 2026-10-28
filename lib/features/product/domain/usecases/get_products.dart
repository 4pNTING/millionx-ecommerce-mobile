import '../../../../core/domain/page_result.dart';
import '../product.dart';
import '../product_repository.dart';

class GetProducts {
  const GetProducts(this._repository);
  final ProductRepository _repository;
  Future<PageResult<Product>> call(
    ProductFilter filter, {
    int limit = 20,
    String currency = 'LAK',
  }) =>
      _repository.getProducts(filter, limit: limit, currency: currency);
}
