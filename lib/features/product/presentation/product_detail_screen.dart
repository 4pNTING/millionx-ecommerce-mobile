import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../../../core/widgets/store_image.dart';
import '../../../core/widgets/store_scaffold.dart';
import 'product_providers.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  String? _variantId;
  String? _imageId;
  @override
  Widget build(BuildContext context) {
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    return StoreScaffold(
      body: ref
          .watch(productProvider(widget.id))
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => RetryPanel(
              message: '${strings.unavailable}\n$error',
              label: strings.retry,
              onRetry: () => ref.invalidate(productProvider(widget.id)),
            ),
            data: (product) {
              final variants = product.variants
                  .where((item) => item.isActive)
                  .toList();
              final matching = variants.where((item) => item.id == _variantId);
              final variant = matching.isNotEmpty
                  ? matching.first
                  : variants.isNotEmpty
                  ? variants.first
                  : null;
              final images = product.images
                  .where(
                    (image) =>
                        image.variantId == null ||
                        image.variantId == variant?.id,
                  )
                  .toList();
              final selected = images.where((image) => image.id == _imageId);
              final image = selected.isNotEmpty
                  ? selected.first
                  : images.isNotEmpty
                  ? images.first
                  : null;
              final prices =
                  variant?.prices.where((price) => price.isActive).toList() ??
                  [];
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      if (product.brand != null) Text(product.brand!),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 360,
                        child: StoreImage(
                          url: image?.url,
                          altText: image?.altText ?? product.name,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in images)
                            InkWell(
                              onTap: () => setState(() => _imageId = item.id),
                              child: Container(
                                width: 72,
                                height: 72,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: item.id == image?.id
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: StoreImage(
                                  url: item.url,
                                  altText: item.altText,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (variants.isNotEmpty)
                        DropdownButton<String>(
                          value: variant?.id,
                          isExpanded: true,
                          items: [
                            for (final item in variants)
                              DropdownMenuItem(
                                value: item.id,
                                child: Text(
                                  '${item.name ?? item.sku} · ${item.sku}',
                                ),
                              ),
                          ],
                          onChanged: (id) => setState(() {
                            _variantId = id;
                            _imageId = null;
                          }),
                        ),
                      const SizedBox(height: 12),
                      for (final price in prices)
                        Text(
                          '${price.amount.toStringAsFixed(0)} ${price.currency}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      if (prices.isEmpty)
                        Text(strings.text('Price unavailable', 'ຍັງບໍ່ມີລາຄາ')),
                      if (variant != null) ...[
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            for (final attribute in variant.attributes.entries)
                              Chip(
                                label: Text(
                                  '${attribute.key}: ${attribute.value}',
                                ),
                              ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 24),
                      Text(product.description ?? ''),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
