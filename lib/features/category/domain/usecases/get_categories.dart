import '../category.dart';
import '../category_repository.dart';

class GetCategories {
  const GetCategories(this._repository);
  final CategoryRepository _repository;
  Future<List<Category>> call() => _repository.getCategories();
}
