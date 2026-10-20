import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/network_providers.dart';
import '../data/datasources/category_remote_data_source.dart';
import '../data/repositories/category_repository_impl.dart';
import '../domain/category.dart';
import '../domain/category_repository.dart';
import '../domain/usecases/get_categories.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepositoryImpl(
    CategoryRemoteDataSource(ref.watch(graphQlGatewayProvider)),
  ),
);
final categoriesProvider = FutureProvider.autoDispose<List<Category>>(
  (ref) => GetCategories(ref.watch(categoryRepositoryProvider))(),
);
