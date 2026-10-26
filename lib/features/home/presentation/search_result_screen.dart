import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../../../core/widgets/store_image.dart';
import '../../../core/widgets/store_scaffold.dart';
import '../../product/domain/product.dart';
import '../../product/presentation/product_providers.dart';

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normalizedQuery = query.trim();
    final filter = (keyword: normalizedQuery, categoryId: null, page: 1);
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    final result = ref.watch(productsProvider(filter));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        title: Text(
          normalizedQuery.isEmpty ? strings.search : normalizedQuery,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, color: Color(0xFF292929)),
        ),
      ),
      body: normalizedQuery.isEmpty
          ? Center(child: Text(strings.search))
          : result.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => RetryPanel(
                message: '${strings.unavailable}\n$error',
                label: strings.retry,
                onRetry: () => ref.invalidate(productsProvider(filter)),
              ),
              data: (page) {
                if (page.items.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        strings.empty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }

                return CustomScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        child: Text(
                          '${page.total} ${strings.products}',
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                      sliver: SliverGrid.builder(
                        itemCount: page.items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.66,
                            ),
                        itemBuilder: (context, index) =>
                            _SearchProductCard(product: page.items[index]),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _SearchProductCard extends StatelessWidget {
  const _SearchProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final image = product.images.isEmpty ? null : product.images.first;
    final price = product.startingPrice;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => context.push('/products/${product.id}'),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEAEAEA)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(9),
                  ),
                  child: SizedBox.expand(
                    child: StoreImage(
                      url: image?.url,
                      altText: image?.altText ?? product.name,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.brand != null && product.brand!.isNotEmpty) ...[
                      Text(
                        product.brand!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                    ],
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price == null
                          ? '—'
                          : '${price.amount.toStringAsFixed(0)} ${price.currency}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFD1343F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
