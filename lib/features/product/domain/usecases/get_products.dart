import '../../../../core/domain/page_result.dart';
import '../product.dart';
import '../product_repository.dart';

class GetProducts {
  const GetProducts(this._repository);
  final ProductRepository _repository;
  Future<PageResult<Product>> call(ProductFilter filter) =>
      _repository.getProducts(filter);
}
