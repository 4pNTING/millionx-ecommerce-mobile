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
