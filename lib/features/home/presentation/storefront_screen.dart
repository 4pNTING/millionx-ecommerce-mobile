import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../../../core/widgets/store_image.dart';
import '../../../core/widgets/store_scaffold.dart';
import '../../category/presentation/category_providers.dart';
import '../../product/domain/product.dart';
import '../../product/presentation/product_providers.dart';

class StorefrontScreen extends ConsumerStatefulWidget {
  const StorefrontScreen({super.key});
  @override
  ConsumerState<StorefrontScreen> createState() => _StorefrontScreenState();
}

class _StorefrontScreenState extends ConsumerState<StorefrontScreen> {
  final _search = TextEditingController();
  String _keyword = '';
  String? _categoryId;
  int _page = 1;
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _searchProducts() => setState(() {
    _keyword = _search.text.trim();
    _page = 1;
  });
  @override
  Widget build(BuildContext context) {
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    final categories = ref.watch(categoriesProvider);
    final filter = (keyword: _keyword, categoryId: _categoryId, page: _page);
    final products = ref.watch(productsProvider(filter));
    return StoreScaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                strings.products,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _search,
                onSubmitted: (_) => _searchProducts(),
                decoration: InputDecoration(
                  labelText: strings.search,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: _searchProducts,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              categories.when(
                data: (items) => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChoiceChip(
                      label: Text(strings.all),
                      selected: _categoryId == null,
                      onSelected: (_) => setState(() {
                        _categoryId = null;
                        _page = 1;
                      }),
                    ),
                    for (final category in items)
                      ChoiceChip(
                        label: Text(category.name),
                        selected: _categoryId == category.id,
                        onSelected: (selected) => setState(() {
                          _categoryId = selected ? category.id : null;
                          _page = 1;
                        }),
                      ),
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (error, stack) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        strings.text(
                          'Categories could not be loaded',
                          'ບໍ່ສາມາດໂຫຼດໝວດສິນຄ້າ',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref.invalidate(categoriesProvider),
                      child: Text(strings.retry),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              products.when(
                data: (result) => Column(
                  children: [
                    if (result.items.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(strings.empty),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final columns = constraints.maxWidth >= 1000
                              ? 4
                              : constraints.maxWidth >= 650
                              ? 3
                              : constraints.maxWidth >= 420
                              ? 2
                              : 1;
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: result.items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columns,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  mainAxisExtent: 340,
                                ),
                            itemBuilder: (_, index) => _ProductCard(
                              product: result.items[index],
                              strings: strings,
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: strings.text('Previous page', 'ໜ້າກ່ອນ'),
                          onPressed: _page > 1
                              ? () => setState(() => _page--)
                              : null,
                          icon: const Icon(Icons.chevron_left),
                        ),
                        Text(
                          '${result.page} / ${result.pageCount} · ${result.total}',
                        ),
                        IconButton(
                          tooltip: strings.text('Next page', 'ໜ້າຕໍ່ໄປ'),
                          onPressed: _page < result.pageCount
                              ? () => setState(() => _page++)
                              : null,
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ],
                ),
                loading: () => const Padding(
                  padding: EdgeInsets.all(60),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => RetryPanel(
                  message: '${strings.unavailable}\n$error',
                  label: strings.retry,
                  onRetry: () => ref.invalidate(productsProvider(filter)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.strings});
  final Product product;
  final StoreStrings strings;
  @override
  Widget build(BuildContext context) {
    final image = product.images.isEmpty ? null : product.images.first;
    final price = product.startingPrice;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/products/${product.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: StoreImage(
                  url: image?.url,
                  altText: image?.altText ?? product.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price == null
                        ? strings.text('Price unavailable', 'ຍັງບໍ່ມີລາຄາ')
                        : '${price.amount.toStringAsFixed(0)} ${price.currency}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
