import 'package:flutter/material.dart';

/// Horizontally scrollable category filters shown beneath the campaign header.
class HomeCategoryTabs extends StatefulWidget {
  const HomeCategoryTabs({super.key, this.onCategorySelected});

  final ValueChanged<String>? onCategorySelected;

  @override
  State<HomeCategoryTabs> createState() => _HomeCategoryTabsState();
}

class _HomeCategoryTabsState extends State<HomeCategoryTabs> {
  static const _categories = [
    'ແນະນຳ',
    'ໂປຣເປີດເທີມ',
    'ລັດອຸດໜູນ',
    'ຂອງໃຊ້ທົ່ວໄປ',
    'ອາຫານ',
    'ເສື້ອຜ້າຜູ້ຊາຍ',
    'ເກີບ ແລະ ກະເປົາ',
    'ເຄື່ອງນອນ',
    'ສະມາດໂຟນ',
    'ກິລາ',
    'ເສື້ອຜ້າຜູ້ຍິງ',
    'ເຄື່ອງໃຊ້ໄຟຟ້າ',
    'ສຸຂະພາບ ແລະ ຢາ',
    'ຊຸດຊັ້ນໃນ',
    'ໝາກໄມ້',
    'ຄວາມງາມ',
    'ເຟີນີເຈີ',
    'ຕົກແຕ່ງບ້ານ',
    'ແມ່ ແລະ ເດັກ',
    'ອຸປະກອນລົດຍົນ',
    'ເຄື່ອງປະດັບ',
    'ຄອມພິວເຕີ',
    'ສິນຄ້ານຳເຂົ້າ',
    'ບັນເທີງ ແລະ ຂອງຫຼິ້ນ',
    'ອາຫານສະເພາະທາງ',
  ];

  final _scrollController = ScrollController();
  final _viewportKey = GlobalKey();
  late final List<GlobalKey> _itemKeys = List.generate(
    _categories.length,
    (_) => GlobalKey(),
  );
  int _selectedIndex = 0;
  double _dragStartOffset = 0;
  double _dragStartX = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateSelectedFromScroll() {
    final viewport = _viewportKey.currentContext?.findRenderObject();
    if (viewport is! RenderBox) return;
    final viewportCenter = viewport
        .localToGlobal(Offset(viewport.size.width / 2, 0))
        .dx;

    var closestIndex = _selectedIndex;
    var closestDistance = double.infinity;
    for (var index = 0; index < _itemKeys.length; index++) {
      final renderObject = _itemKeys[index].currentContext?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;
      final center = renderObject
          .localToGlobal(Offset(renderObject.size.width / 2, 0))
          .dx;
      final distance = (center - viewportCenter).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        closestIndex = index;
      }
    }

    if (closestIndex != _selectedIndex && mounted) {
      setState(() => _selectedIndex = closestIndex);
      widget.onCategorySelected?.call(_categories[closestIndex]);
    }
  }

  Future<void> _selectCategory(int index) async {
    setState(() => _selectedIndex = index);
    widget.onCategorySelected?.call(_categories[index]);
    final itemContext = _itemKeys[index].currentContext;
    if (itemContext == null) return;
    await Scrollable.ensureVisible(
      itemContext,
      alignment: 0.5,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 11,
      top: 149,
      width: 418,
      height: 34,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification ||
              notification is ScrollEndNotification) {
            _updateSelectedFromScroll();
          }
          return false;
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragStart: (details) {
            if (!_scrollController.hasClients) return;
            _dragStartOffset = _scrollController.offset;
            _dragStartX = details.localPosition.dx;
          },
          onHorizontalDragUpdate: (details) {
            if (!_scrollController.hasClients) return;
            final dragDistance = details.localPosition.dx - _dragStartX;
            final maxScroll = _scrollController.position.maxScrollExtent;
            final nextOffset = (_dragStartOffset - dragDistance).clamp(
              0.0,
              maxScroll,
            );
            _scrollController.jumpTo(nextOffset);
          },
          child: SingleChildScrollView(
            key: _viewportKey,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(_categories.length, (index) {
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  key: _itemKeys[index],
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _selectCategory(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _categories[index],
                          style: TextStyle(
                            color: isSelected
                                ? const Color(0xFFF43F5E)
                                : const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          width: isSelected ? 18 : 0,
                          height: 2,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF43F5E),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
