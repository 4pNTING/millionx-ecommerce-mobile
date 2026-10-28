import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/page_result.dart';
import '../../../core/network/network_providers.dart';
import '../data/datasources/product_remote_data_source.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/product.dart';
import '../domain/product_repository.dart';
import '../domain/usecases/get_product.dart';
import '../domain/usecases/get_products.dart';

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepositoryImpl(
    ProductRemoteDataSource(ref.watch(graphQlGatewayProvider)),
  ),
);
final productsProvider = FutureProvider.autoDispose
    .family<PageResult<Product>, ProductFilter>(
      (ref, filter) =>
          GetProducts(ref.watch(productRepositoryProvider))(filter),
    );
final productProvider = FutureProvider.autoDispose.family<Product, String>(
  (ref, id) => GetProduct(ref.watch(productRepositoryProvider))(id),
);

enum ProductFeedStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == ProductFeedStatus.initial;
  bool get isLoading => this == ProductFeedStatus.loading;
  bool get isSuccess => this == ProductFeedStatus.success;
  bool get isError => this == ProductFeedStatus.error;
}

enum LoadMoreStatus {
  idle,
  loading,
  error,
  done;

  bool get isIdle => this == LoadMoreStatus.idle;
  bool get isLoading => this == LoadMoreStatus.loading;
  bool get isError => this == LoadMoreStatus.error;
  bool get isDone => this == LoadMoreStatus.done;
}

class ProductFeedState {
  const ProductFeedState({
    this.status = ProductFeedStatus.initial,
    this.loadMoreStatus = LoadMoreStatus.idle,
    this.items = const [],
    this.total = 0,
    this.page = 1,
    this.limit = 20,
    this.error,
    this.loadMoreError,
    this.keyword = '',
    this.categoryId,
    this.currency = 'LAK',
  });

  final ProductFeedStatus status;
  final LoadMoreStatus loadMoreStatus;
  final List<Product> items;
  final int total;
  final int page;
  final int limit;
  final Object? error;
  final Object? loadMoreError;
  final String keyword;
  final String? categoryId;
  final String currency;

  bool get isLoading => status.isLoading;
  bool get isLoadingMore => loadMoreStatus.isLoading;
  bool get hasMore => !loadMoreStatus.isDone;

  ProductFeedState copyWith({
    ProductFeedStatus? status,
    LoadMoreStatus? loadMoreStatus,
    List<Product>? items,
    int? total,
    int? page,
    int? limit,
    Object? error = _feedSentinel,
    Object? loadMoreError = _feedSentinel,
    String? keyword,
    String? categoryId,
    String? currency,
  }) {
    return ProductFeedState(
      status: status ?? this.status,
      loadMoreStatus: loadMoreStatus ?? this.loadMoreStatus,
      items: items ?? this.items,
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      error: identical(error, _feedSentinel) ? this.error : error,
      loadMoreError: identical(loadMoreError, _feedSentinel)
          ? this.loadMoreError
          : loadMoreError,
      keyword: keyword ?? this.keyword,
      categoryId: categoryId ?? this.categoryId,
      currency: currency ?? this.currency,
    );
  }
}

const Object _feedSentinel = Object();

class ProductFeedNotifier extends StateNotifier<ProductFeedState> {
  ProductFeedNotifier(
    this._getProducts, {
    String? categoryId,
    String keyword = '',
    String currency = 'LAK',
  }) : super(
          ProductFeedState(
            status: ProductFeedStatus.loading,
            categoryId: categoryId,
            keyword: keyword.trim(),
            currency: currency,
          ),
        ) {
    loadInitial(
      categoryId: categoryId,
      keyword: keyword,
      currency: currency,
    );
  }

  final GetProducts _getProducts;
  int _requestId = 0;

  /// Requirement 1 & 9: Loads initial page 1, cancels any pending responses
  Future<void> loadInitial({
    String? categoryId,
    String? keyword,
    String? currency,
  }) async {
    final activeCategoryId = categoryId ?? state.categoryId;
    final activeKeyword = (keyword ?? state.keyword).trim();
    final activeCurrency = currency ?? state.currency;

    final currentRequestId = ++_requestId;

    state = ProductFeedState(
      status: ProductFeedStatus.loading,
      loadMoreStatus: LoadMoreStatus.idle,
      items: const [],
      page: 1,
      limit: 20,
      total: 0,
      error: null,
      loadMoreError: null,
      categoryId: activeCategoryId,
      keyword: activeKeyword,
      currency: activeCurrency,
    );

    try {
      final result = await _getProducts(
        (
          keyword: activeKeyword,
          categoryId: activeCategoryId,
          page: 1,
        ),
        limit: 20,
        currency: activeCurrency,
      );

      // Requirement 9: Prevent stale response from mixing
      if (currentRequestId != _requestId) return;

      // Requirement 4: Deduplicate items by _id
      final seenIds = <String>{};
      final uniqueItems = <Product>[];
      for (final item in result.items) {
        if (seenIds.add(item.id)) {
          uniqueItems.add(item);
        }
      }

      // Requirement 6: Stop loading when items complete total or backend sends empty items
      final hasMore =
          uniqueItems.isNotEmpty && uniqueItems.length < result.total;

      state = state.copyWith(
        status: ProductFeedStatus.success,
        loadMoreStatus: hasMore ? LoadMoreStatus.idle : LoadMoreStatus.done,
        items: uniqueItems,
        total: result.total,
        page: 1,
        error: null,
      );
    } catch (e) {
      if (currentRequestId != _requestId) return;
      state = state.copyWith(
        status: ProductFeedStatus.error,
        error: e,
      );
    }
  }

  /// Requirement 9: When category/keyword/filter changes, reset to page 1 and load
  Future<void> setFilter({
    String? categoryId,
    bool updateCategory = false,
    String? keyword,
    bool updateKeyword = false,
    String? currency,
  }) async {
    final newCategory = updateCategory ? categoryId : state.categoryId;
    final newKeyword = updateKeyword ? (keyword ?? '').trim() : state.keyword;
    final newCurrency = currency ?? state.currency;

    await loadInitial(
      categoryId: newCategory,
      keyword: newKeyword,
      currency: newCurrency,
    );
  }

  /// Requirement 2 & 3: Load next page, protected by isLoadingMore
  Future<void> loadMore() async {
    // Requirement 3: Prevent duplicate requests with isLoadingMore
    // Requirement 6: Stop loading when items complete total or backend sends empty items
    if (state.isLoading ||
        state.isLoadingMore ||
        !state.hasMore ||
        state.loadMoreError != null) {
      return;
    }

    final currentRequestId = _requestId;
    final nextPage = state.page + 1;

    state = state.copyWith(
      loadMoreStatus: LoadMoreStatus.loading,
      loadMoreError: null,
    );

    try {
      // Requirement 7: Maintain Category, keyword, currency, and filters for next page
      final result = await _getProducts(
        (
          keyword: state.keyword,
          categoryId: state.categoryId,
          page: nextPage,
        ),
        limit: state.limit,
        currency: state.currency,
      );

      // Requirement 9: Prevent stale response
      if (currentRequestId != _requestId) return;

      // Requirement 4: Append new items to existing list, deduping by _id
      final seenIds = state.items.map((p) => p.id).toSet();
      final newUniqueItems = <Product>[];
      for (final item in result.items) {
        if (seenIds.add(item.id)) {
          newUniqueItems.add(item);
        }
      }
      final updatedItems = [...state.items, ...newUniqueItems];

      // Requirement 6: Stop loading when items complete total or backend sends empty items
      final hasMore =
          result.items.isNotEmpty && updatedItems.length < result.total;

      // Requirement 5: Increment page number ONLY when load succeeds
      state = state.copyWith(
        loadMoreStatus: hasMore ? LoadMoreStatus.idle : LoadMoreStatus.done,
        items: updatedItems,
        page: nextPage,
        total: result.total,
        loadMoreError: null,
      );
    } catch (e) {
      if (currentRequestId != _requestId) return;

      // Requirement 5: On failure, keep already loaded products, do not increment page, set loadMoreError
      state = state.copyWith(
        loadMoreStatus: LoadMoreStatus.error,
        loadMoreError: e,
      );
    }
  }

  /// Requirement 5: Retry the failed page while preserving loaded items
  Future<void> retryLoadMore() async {
    if (state.isLoadingMore) return;
    state = state.copyWith(
      loadMoreStatus: LoadMoreStatus.idle,
      loadMoreError: null,
    );
    await loadMore();
  }

  /// Retry initial load
  Future<void> retryInitial() async {
    await loadInitial(
      categoryId: state.categoryId,
      keyword: state.keyword,
      currency: state.currency,
    );
  }
}

final productFeedProvider =
    StateNotifierProvider<ProductFeedNotifier, ProductFeedState>((ref) {
  final getProducts = GetProducts(ref.watch(productRepositoryProvider));
  return ProductFeedNotifier(getProducts);
});
