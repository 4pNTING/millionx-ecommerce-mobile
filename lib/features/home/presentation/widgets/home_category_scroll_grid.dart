import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../category/domain/category.dart';
import '../../../category/presentation/category_providers.dart';

/// Horizontal category navigation shortcuts on Home screen using real backend categories.
class HomeCategoryScrollGrid extends ConsumerWidget {
  const HomeCategoryScrollGrid({
    super.key,
    this.selectedCategoryId,
    this.onCategorySelected,
  });

  final String? selectedCategoryId;
  final ValueChanged<String?>? onCategorySelected;

  static const _fontFallback = ['Noto Sans Lao', 'Noto Sans', 'sans-serif'];

  static (IconData, Color, Color) _getCategoryVisuals(
    String slug,
    String name,
  ) {
    final lower = '${slug.toLowerCase()} ${name.toLowerCase()}';
    if (lower.contains('electron') || lower.contains('ເອເລັກໂຕຣນິກ')) {
      return (
        Icons.devices_rounded,
        const Color(0xFFEFF6FF),
        const Color(0xFF2563EB),
      );
    }
    if (lower.contains('fashion') || lower.contains('ແຟຊັ່ນ')) {
      return (
        Icons.checkroom_rounded,
        const Color(0xFFFDF2F8),
        const Color(0xFFDB2777),
      );
    }
    if (lower.contains('computer') || lower.contains('ຄອມພິວເຕີ')) {
      return (
        Icons.computer_rounded,
        const Color(0xFFF5F3FF),
        const Color(0xFF7C3AED),
      );
    }
    if (lower.contains('laptop') || lower.contains('ແລັບທັອບ')) {
      return (
        Icons.laptop_mac_rounded,
        const Color(0xFFF0FDFA),
        const Color(0xFF0D9488),
      );
    }
    if (lower.contains('phone') || lower.contains('ໂທລະສັບ')) {
      return (
        Icons.phone_iphone_rounded,
        const Color(0xFFECFDF5),
        const Color(0xFF059669),
      );
    }
    if (lower.contains('headphone') || lower.contains('ຫູຟັງ')) {
      return (
        Icons.headphones_rounded,
        const Color(0xFFFFFBEB),
        const Color(0xFFD97706),
      );
    }
    if (lower.contains('men') || lower.contains('ຜູ້ຊາຍ')) {
      return (
        Icons.person_rounded,
        const Color(0xFFEEF2FF),
        const Color(0xFF4F46E5),
      );
    }
    if (lower.contains('women') || lower.contains('ຜູ້ຍິງ')) {
      return (
        Icons.woman_rounded,
        const Color(0xFFFFF1F2),
        const Color(0xFFE11D48),
      );
    }
    if (lower.contains('shoe') || lower.contains('ເກີບ')) {
      return (
        Icons.roller_skating_rounded,
        const Color(0xFFFFF7ED),
        const Color(0xFFEA580C),
      );
    }
    if (lower.contains('appliance') || lower.contains('ເຄື່ອງໃຊ້ໄຟຟ້າ')) {
      return (
        Icons.kitchen_rounded,
        const Color(0xFFF0FDF4),
        const Color(0xFF16A34A),
      );
    }
    return (
      Icons.category_rounded,
      const Color(0xFFF8FAFC),
      const Color(0xFF64748B),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Positioned(
      left: 0,
      top: 245,
      child: Container(
        width: 440,
        height: 96,
        color: Colors.white,
        child: categoriesAsync.when(
          data: (categories) {
            // Deduplicate categories by id
            final uniqueCategories = <Category>[];
            final seenIds = <String>{};
            for (final c in categories) {
              final lower = '${c.name} ${c.slug}'.toLowerCase();
              if (lower.contains('test') || lower.contains('ທົດສອບ')) continue;
              if (c.name.trim().isNotEmpty && seenIds.add(c.id)) {
                uniqueCategories.add(c);
              }
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Real categories from backend displayed FIRST
                  ...uniqueCategories.map((cat) {
                    final visuals = _getCategoryVisuals(cat.slug, cat.name);
                    final isSelected = selectedCategoryId == cat.id;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // Toggle or select
                        if (isSelected) {
                          onCategorySelected?.call(null);
                        } else {
                          onCategorySelected?.call(cat.id);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SizedBox(
                          width: 68,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFFB255A)
                                      : visuals.$2,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFFFB255A)
                                        : visuals.$3.withValues(alpha: 0.25),
                                    width: isSelected ? 2 : 1,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: const Color(
                                              0xFFFB255A,
                                            ).withValues(alpha: 0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Icon(
                                  visuals.$1,
                                  size: 24,
                                  color: isSelected ? Colors.white : visuals.$3,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                cat.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFFFB255A)
                                      : const Color(0xFF1E293B),
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontFamilyFallback: _fontFallback,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  // Shortcut to view all categories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onCategorySelected?.call(null),
                      child: SizedBox(
                        width: 68,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFFE2E8F0),
                                ),
                              ),
                              child: const Icon(
                                Icons.refresh_rounded,
                                size: 22,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'ທັງໝົດ',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontFamilyFallback: _fontFallback,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Color(0xFFF43F5E),
              ),
            ),
          ),
          error: (error, stack) => Center(
            child: TextButton.icon(
              onPressed: () => ref.invalidate(categoriesProvider),
              icon: const Icon(
                Icons.refresh_rounded,
                size: 18,
                color: Color(0xFFF43F5E),
              ),
              label: const Text(
                'ໂຫຼດໝວດໝູ່ໃໝ່',
                style: TextStyle(
                  color: Color(0xFFF43F5E),
                  fontSize: 12,
                  fontFamilyFallback: _fontFallback,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
