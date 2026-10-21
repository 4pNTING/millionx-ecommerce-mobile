import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../product/domain/product.dart';
import '../../../product/presentation/product_providers.dart';

/// Promotion & subsidized deals banner card on Home screen displaying real products.
class HomePromotionBanner extends ConsumerWidget {
  const HomePromotionBanner({super.key});

  static const _fontFallback = ['Noto Sans Lao', 'Noto Sans', 'sans-serif'];

  String _formatPrice(double amount) {
    final parts = amount.toStringAsFixed(0).split('');
    final buffer = StringBuffer();
    for (var i = 0; i < parts.length; i++) {
      if (i > 0 && (parts.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(parts[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(
      productsProvider(const (keyword: '', categoryId: null, page: 1)),
    );

    return Positioned(
      left: 8,
      top: 348,
      child: Container(
        width: 424,
        height: 152,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFEF2F4), Color(0xFFFFF7ED)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFE4E6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Header
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFB658D), Color(0xFFFB255A)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'ດີລພິເສດ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Flexible(
                          child: Text(
                            'ຫຼຸດລາຄາພິເສດມື້ນີ້',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF881337),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'ເບິ່ງເພີ່ມ >',
                    style: TextStyle(
                      color: Color(0xFFF43F5E),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamilyFallback: _fontFallback,
                    ),
                  ),
                ],
              ),
            ),

            // Products row
            Expanded(
              child: productsAsync.when(
                data: (page) {
                  final items = page.items.take(4).toList();
                  if (items.isEmpty) {
                    return const Center(
                      child: Text(
                        'ບໍ່ມີສິນຄ້າໂປຣໂມຊັ່ນ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                          fontFamilyFallback: _fontFallback,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final product = items[index];
                      final price = product.startingPrice;
                      final imageUrl = product.images.isNotEmpty
                          ? AppConfig.imageUrl(product.images.first.url)
                          : null;

                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => context.push('/products/${product.id}'),
                        child: Container(
                          width: 94,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Product Thumbnail
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: imageUrl != null &&
                                          imageUrl.isNotEmpty &&
                                          !imageUrl.contains('example.com')
                                      ? Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) =>
                                              _buildFallbackThumbnail(product),
                                        )
                                      : _buildFallbackThumbnail(product),
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Price
                              Text(
                                price != null
                                    ? '₭${_formatPrice(price.amount)}'
                                    : 'ສິນຄ້າແນະນຳ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFF43F5E),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Inter',
                                  fontFamilyFallback: _fontFallback,
                                ),
                              ),
                              // Title
                              Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 10,
                                  fontFamilyFallback: _fontFallback,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFFF43F5E),
                    ),
                  ),
                ),
                error: (error, stack) => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFallbackThumbnail(Product product) {
    final lower = '${product.name.toLowerCase()} ${product.brand?.toLowerCase() ?? ''}';
    IconData icon = Icons.shopping_bag_rounded;
    Color bg = const Color(0xFFFFF1F2);
    Color iconColor = const Color(0xFFFB7185);

    if (lower.contains('ແລັບທັອບ') || lower.contains('laptop') || lower.contains('ຄອມ')) {
      icon = Icons.laptop_mac_rounded;
      bg = const Color(0xFFEFF6FF);
      iconColor = const Color(0xFF2563EB);
    } else if (lower.contains('ຫູຟັງ') || lower.contains('headphone')) {
      icon = Icons.headphones_rounded;
      bg = const Color(0xFFFFFBEB);
      iconColor = const Color(0xFFD97706);
    } else if (lower.contains('ໄຟຟ້າ') || lower.contains('appliance')) {
      icon = Icons.kitchen_rounded;
      bg = const Color(0xFFF0FDF4);
      iconColor = const Color(0xFF16A34A);
    }

    return Container(
      color: bg,
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 24,
        color: iconColor,
      ),
    );
  }
}
