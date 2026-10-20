import '../../../../core/network/graphql_api_client.dart';
import '../../domain/category.dart';
import '../models/category_model.dart';

class CategoryRemoteDataSource {
  const CategoryRemoteDataSource(this._gateway);
  final GraphQlGateway _gateway;
  static const document = r'''
    query StoreCategories($filter: CategoryFilterInput) {
      categories(filter: $filter) {
        items { id parentId name slug } total page limit
      }
    }
  ''';
  Future<List<Category>> getCategories() async {
    final data = await _gateway.execute(
      document: document,
      variables: {
        'filter': {
          'fetchAll': true,
          'includeInactive': false,
          'rootOnly': false,
        },
      },
    );
    final items = (data['categories'] as Map<String, dynamic>)['items'] as List;
    return items
        .map<Category>((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
