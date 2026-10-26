import '../../domain/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    super.parentId,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: (json['_id'] ?? json['id']) as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    parentId: json['parentId'] as String?,
  );
}
