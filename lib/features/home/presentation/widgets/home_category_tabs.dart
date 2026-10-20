import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../category/domain/category.dart';
import '../../../category/presentation/category_providers.dart';

/// Horizontal category tab filter bar on Home screen using real backend categories.
class HomeCategoryTabs extends ConsumerStatefulWidget {
  const HomeCategoryTabs({
    super.key,
    this.selectedCategoryId,
    this.onCategorySelected,
  });

  final String? selectedCategoryId;
  final ValueChanged<String?>? onCategorySelected;

  @override
  ConsumerState<HomeCategoryTabs> createState() => _HomeCategoryTabsState();
}

class _HomeCategoryTabsState extends ConsumerState<HomeCategoryTabs> {
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedCategoryId;
  }

  @override
  void didUpdateWidget(covariant HomeCategoryTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategoryId != oldWidget.selectedCategoryId) {
      _selectedId = widget.selectedCategoryId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Positioned(
      left: 11,
      top: 143,
      child: SizedBox(
        width: 428,
        height: 42,
        child: categoriesAsync.when(
          data: (categories) {
            // Deduplicate categories by name and keep clean list
            final uniqueCategories = <Category>[];
            final seenNames = <String>{};
            for (final c in categories) {
              final trimmed = c.name.trim();
              if (trimmed.isNotEmpty && seenNames.add(trimmed)) {
                uniqueCategories.add(c);
              }
            }

            final items = [
              (id: null, name: 'ທັງໝົດ'),
              ...uniqueCategories.map((c) => (id: c.id as String?, name: c.name)),
            ];

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = _selectedId == item.id;

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() => _selectedId = item.id);
                    widget.onCategorySelected?.call(item.id);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFFF43F5E)
                              : const Color(0xFF151515),
                          fontSize: isSelected ? 21 : 19,
                          fontFamily: 'Inter',
                          fontFamilyFallback: const ['Noto Sans Lao', 'sans-serif'],
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 3),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 3,
                        width: isSelected ? 24 : 0,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFF43F5E)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => ListView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            children: const [
              Text(
                'ທັງໝົດ',
                style: TextStyle(
                  color: Color(0xFFF43F5E),
                  fontSize: 21,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 24),
              Text(
                'ກຳລັງໂຫລດ...',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          error: (error, stack) => ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            children: const [
              Text(
                'ທັງໝົດ',
                style: TextStyle(
                  color: Color(0xFFF43F5E),
                  fontSize: 21,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
