class PageResult<T> {
  const PageResult({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
  });
  final List<T> items;
  final int total;
  final int page;
  final int limit;
  int get pageCount => total == 0 ? 1 : (total + limit - 1) ~/ limit;
}
