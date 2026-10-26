import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/category.dart';
import 'category_providers.dart';

/// Full, dedicated Category Screen powered by real backend data.
class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key, this.onCategorySelected});

  final ValueChanged<String>? onCategorySelected;

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  static const _fontFallback = ['Noto Sans Lao', 'Noto Sans', 'sans-serif'];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedRootId;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  IconData _getCategoryIcon(String slug, String name) {
    final lower = '${slug.toLowerCase()} ${name.toLowerCase()}';
    if (lower.contains('electron') || lower.contains('ເອເລັກໂຕຣນິກ')) {
      return Icons.devices_rounded;
    }
    if (lower.contains('fashion') || lower.contains('ແຟຊັ່ນ')) {
      return Icons.checkroom_rounded;
    }
    if (lower.contains('computer') || lower.contains('ຄອມພິວເຕີ')) {
      return Icons.computer_rounded;
    }
    if (lower.contains('laptop') || lower.contains('ແລັບທັອບ')) {
      return Icons.laptop_mac_rounded;
    }
    if (lower.contains('phone') || lower.contains('ໂທລະສັບ')) {
      return Icons.phone_iphone_rounded;
    }
    if (lower.contains('headphone') || lower.contains('ຫູຟັງ')) {
      return Icons.headphones_rounded;
    }
    if (lower.contains('men') || lower.contains('ຜູ້ຊາຍ')) {
      return Icons.person_rounded;
    }
    if (lower.contains('women') || lower.contains('ຜູ້ຍິງ')) {
      return Icons.woman_rounded;
    }
    if (lower.contains('shoe') || lower.contains('ເກີບ')) {
      return Icons.roller_skating_rounded;
    }
    if (lower.contains('appliance') || lower.contains('ເຄື່ອງໃຊ້ໄຟຟ້າ')) {
      return Icons.kitchen_rounded;
    }
    return Icons.category_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'ຫມວດໝູ່ສິນຄ້າ',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF64748B)),
            onPressed: () => ref.invalidate(categoriesProvider),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val.trim()),
                decoration: InputDecoration(
                  hintText: 'ຄົ້ນຫາຫມວດໝູ່...',
                  hintStyle: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: categoriesAsync.when(
        data: (categories) {
          if (categories.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.category_outlined,
                    size: 64,
                    color: Color(0xFFCBD5E1),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ບໍ່ພົບໝວດໝູ່ສິນຄ້າ',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 16,
                      fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(categoriesProvider),
                    child: const Text('ໂຫຼດໃໝ່'),
                  ),
                ],
              ),
            );
          }

          // Exclude test / placeholder categories
          final realCategories = categories.where((c) {
            final lower = '${c.name} ${c.slug}'.toLowerCase();
            return !lower.contains('test') && !lower.contains('ທົດສອບ');
          }).toList();

          // Filter by search query if user typed
          final filtered = _searchQuery.isEmpty
              ? realCategories
              : realCategories
                  .where(
                    (c) =>
                        c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                        c.slug.toLowerCase().contains(_searchQuery.toLowerCase()),
                  )
                  .toList();

          // Organize root categories (parentId == null) and subcategories
          final rootCategories = filtered.where((c) => c.parentId == null).toList();
          if (_selectedRootId == null && rootCategories.isNotEmpty) {
            _selectedRootId = rootCategories.first.id;
          }

          // If searching, show direct grid of matched categories
          if (_searchQuery.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final cat = filtered[index];
                return _buildCategoryCard(cat);
              },
            );
          }

          // Split View: Left side = Root Categories, Right side = Subcategories
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left root categories sidebar
              Container(
                width: 110,
                color: Colors.white,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 90),
                  itemCount: rootCategories.length,
                  itemBuilder: (context, index) {
                    final root = rootCategories[index];
                    final isSelected = root.id == _selectedRootId;

                    return GestureDetector(
                      onTap: () => setState(() => _selectedRootId = root.id),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFF1F2) : Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: isSelected
                                  ? const Color(0xFFF43F5E)
                                  : Colors.transparent,
                              width: 3.5,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getCategoryIcon(root.slug, root.name),
                              size: 26,
                              color: isSelected
                                  ? const Color(0xFFF43F5E)
                                  : const Color(0xFF64748B),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              root.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? const Color(0xFFF43F5E)
                                    : const Color(0xFF334155),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFE2E8F0)),

              // Right side: Selected Root Category details and Subcategories
              Expanded(
                child: Builder(
                  builder: (context) {
                    Category? selectedRoot;
                    for (final c in rootCategories) {
                      if (c.id == _selectedRootId) {
                        selectedRoot = c;
                        break;
                      }
                    }
                    selectedRoot ??= rootCategories.isNotEmpty
                        ? rootCategories.first
                        : (categories.isNotEmpty ? categories.first : null);

                    if (selectedRoot == null) {
                      return const Center(
                        child: Text(
                          'ບໍ່ພົບໝວດໝູ່',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                          ),
                        ),
                      );
                    }

                    // Collect all descendant subcategories at any depth with cycle protection
                    final allSubs = <Category>[];
                    final visitedIds = <String>{selectedRoot.id};
                    final queue = <String>[selectedRoot.id];

                    while (queue.isNotEmpty) {
                      final currentId = queue.removeAt(0);
                      for (final c in categories) {
                        if (c.parentId == currentId && visitedIds.add(c.id)) {
                          allSubs.add(c);
                          queue.add(c.id);
                        }
                      }
                    }

                    return ListView(
                      padding: const EdgeInsets.fromLTRB(14, 16, 14, 100),
                      children: [
                        // Banner for current root category
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFB658D), Color(0xFFFB255A)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _getCategoryIcon(selectedRoot.slug, selectedRoot.name),
                                size: 36,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedRoot.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${allSubs.length} ໝວດໝູ່ຍ່ອຍ',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'ໝວດໝູ່ຍ່ອຍ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                            fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                          ),
                        ),

                        const SizedBox(height: 12),

                        if (allSubs.isEmpty)
                          Container(
                            padding: const EdgeInsets.all(24),
                            alignment: Alignment.center,
                            child: const Text(
                              'ບໍ່ມີໝວດໝູ່ຍ່ອຍໃນໝວດນີ້',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 13,
                                fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                              ),
                            ),
                          )
                        else
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: allSubs.length,
                            itemBuilder: (context, index) {
                              final sub = allSubs[index];
                              return _buildCategoryCard(sub);
                            },
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFF43F5E),
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 56,
                color: Color(0xFFF43F5E),
              ),
              const SizedBox(height: 12),
              const Text(
                'ເກີດຂໍ້ຜິດພາດໃນການໂຫຼດໝວດໝູ່',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => ref.invalidate(categoriesProvider),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('ລອງໃໝ່'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF43F5E),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Category cat) {
    return InkWell(
      onTap: () {
        if (widget.onCategorySelected != null) {
          widget.onCategorySelected!(cat.id);
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ເລືອກໝວດໝູ່: ${cat.name}'),
            duration: const Duration(seconds: 1),
            backgroundColor: const Color(0xFF0F172A),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getCategoryIcon(cat.slug, cat.name),
                size: 22,
                color: const Color(0xFFF43F5E),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cat.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
                              fontFamilyFallback: _fontFallback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
