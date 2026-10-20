class Category {
  const Category({
    required this.id,
    required this.name,
    required this.slug,
    this.parentId,
  });
  final String id;
  final String name;
  final String slug;
  final String? parentId;
}
