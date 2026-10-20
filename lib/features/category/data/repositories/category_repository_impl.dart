import '../../domain/category.dart';
import '../../domain/category_repository.dart';
import '../datasources/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl(this._remote);
  final CategoryRemoteDataSource _remote;
  @override
  Future<List<Category>> getCategories() async {
    final list = await _remote.getCategories();
    return List<Category>.from(list);
  }
}
