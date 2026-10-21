import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../category/presentation/category_providers.dart';
import '../../../product/domain/product.dart';
import '../../../product/presentation/product_providers.dart';

/// Dynamic, responsive product feed powered by real backend data.
class HomeProductFeed extends ConsumerWidget {
  const HomeProductFeed({
    super.key,
    this.selectedCategoryId,
    this.onClearCategory,
  });

  final String? selectedCategoryId;
  final VoidCallback? onClearCategory;

  static const _fontFallback = ['Noto Sans Lao', 'Noto Sans', 'sans-serif'];

  static String _formatPrice(double amount) {
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
      productsProvider((keyword: '', categoryId: selectedCategoryId, page: 1)),
    );
    final categoriesAsync = ref.watch(categoriesProvider);

    // Resolve selected category name if applicable
    String? categoryName;
    if (selectedCategoryId != null) {
      categoriesAsync.whenData((categories) {
        for (final c in categories) {
          if (c.id == selectedCategoryId) {
            categoryName = c.name;
            break;
          }
        }
      });
    }

    return Positioned(
      left: 0,
      top: 568,
      child: SizedBox(
        width: 440,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Feed Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 18,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFB658D), Color(0xFFFB255A)],
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                categoryName != null
                                    ? 'ໝວດໝູ່: $categoryName'
                                    : 'ສິນຄ້າແນະນຳ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontFamilyFallback: _fontFallback,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          categoryName != null
                              ? 'ສະແດງສິນຄ້າໃນໝວດນີ້'
                              : 'ສິນຄ້າຍອດນິຍົມ ຄຸນນະພາບດີ ລາຄາພິເສດ',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontFamilyFallback: _fontFallback,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Clear filter badge if filtered
                  if (selectedCategoryId != null)
                    GestureDetector(
                      onTap: onClearCategory,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF1F2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFFFE4E6)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ທັງໝົດ',
                              style: TextStyle(
                                color: Color(0xFFF43F5E),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamilyFallback: _fontFallback,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.close_rounded, size: 14, color: Color(0xFFF43F5E)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 14),

              // Product Feed Content
              productsAsync.when(
                data: (pageResult) {
                  final items = pageResult.items;

                  if (items.isEmpty) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF1F2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.inventory_2_outlined,
                              size: 44,
                              color: Color(0xFFF43F5E),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            categoryName != null
                                ? 'ບໍ່ພົບສິນຄ້າໃນໝວດ "$categoryName"'
                                : 'ບໍ່ມີສິນຄ້າໃນລະບົບເທື່ອ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'ກະລຸນາເລືອກໝວດໝູ່ອື່ນ ຫຼື ກວດເບິ່ງສິນຄ້າທັງໝົດ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 12,
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: onClearCategory,
                            icon: const Icon(Icons.refresh_rounded, size: 18),
                            label: const Text('ເບິ່ງສິນຄ້າທັງໝົດ'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF43F5E),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.68,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final product = items[index];
                      return _buildProductCard(context, product);
                    },
                  );
                },
                loading: () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) => _buildSkeletonCard(),
                ),
                error: (error, stack) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline_rounded, size: 36, color: Color(0xFFF43F5E)),
                      const SizedBox(height: 8),
                      const Text(
                        'ເກີດຂໍ້ຜິດພາດໃນການໂຫຼດສິນຄ້າ',
                        style: TextStyle(
                          color: Color(0xFF9F1239),
                          fontWeight: FontWeight.w600,
                          fontFamilyFallback: _fontFallback,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(productsProvider),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF43F5E),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('ລອງໃໝ່'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    final price = product.startingPrice;
    final imageUrl = product.images.isNotEmpty
        ? AppConfig.imageUrl(product.images.first.url)
        : null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/products/${product.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Container
            Expanded(
              flex: 11,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: imageUrl != null &&
                              imageUrl.isNotEmpty &&
                              !imageUrl.contains('example.com')
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  _buildFallbackImage(product),
                            )
                          : _buildFallbackImage(product),
                    ),
                  ),

                  // Free Shipping Badge
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16A34A),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.local_shipping_rounded, size: 10, color: Colors.white),
                          SizedBox(width: 3),
                          Text(
                            'ສົ່ງຟຣີ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.brand != null && product.brand!.isNotEmpty)
                          Text(
                            product.brand!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamilyFallback: _fontFallback,
                            ),
                          ),
                        const SizedBox(height: 2),
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                            fontFamily: 'Inter',
                            fontFamilyFallback: _fontFallback,
                          ),
                        ),
                      ],
                    ),

                    // Price & Rating
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              '₭ ',
                              style: TextStyle(
                                color: Color(0xFFF43F5E),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamilyFallback: _fontFallback,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                price != null ? _formatPrice(price.amount) : '0',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFF43F5E),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Icon(Icons.star_rounded, size: 13, color: Color(0xFFF59E0B)),
                            SizedBox(width: 2),
                            Text(
                              '5.0',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'ຂາຍແລ້ວ 20+',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 10,
                                fontFamilyFallback: _fontFallback,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackImage(Product product) {
    final lower = '${product.name.toLowerCase()} ${product.brand?.toLowerCase() ?? ''}';
    IconData icon = Icons.shopping_bag_rounded;
    Color color1 = const Color(0xFFF1F5F9);
    Color color2 = const Color(0xFFE2E8F0);
    Color iconColor = const Color(0xFF64748B);

    if (lower.contains('ແລັບທັອບ') || lower.contains('laptop') || lower.contains('ຄອມ')) {
      icon = Icons.laptop_mac_rounded;
      color1 = const Color(0xFFEFF6FF);
      color2 = const Color(0xFFDBEAFE);
      iconColor = const Color(0xFF2563EB);
    } else if (lower.contains('ຫູຟັງ') || lower.contains('headphone')) {
      icon = Icons.headphones_rounded;
      color1 = const Color(0xFFFFFBEB);
      color2 = const Color(0xFFFEF3C7);
      iconColor = const Color(0xFFD97706);
    } else if (lower.contains('ໄຟຟ້າ') || lower.contains('appliance')) {
      icon = Icons.kitchen_rounded;
      color1 = const Color(0xFFF0FDF4);
      color2 = const Color(0xFFDCFCE7);
      iconColor = const Color(0xFF16A34A);
    } else if (lower.contains('ໂທລະສັບ') || lower.contains('phone')) {
      icon = Icons.phone_iphone_rounded;
      color1 = const Color(0xFFECFDF5);
      color2 = const Color(0xFFD1FAE5);
      iconColor = const Color(0xFF059669);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 48, color: iconColor),
    );
  }

  Widget _buildSkeletonCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 11,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 60, height: 10, color: const Color(0xFFF1F5F9)),
                  Container(width: double.infinity, height: 12, color: const Color(0xFFF1F5F9)),
                  Container(width: 80, height: 14, color: const Color(0xFFF1F5F9)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
