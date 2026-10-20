import 'package:flutter/material.dart';

/// Horizontal category navigation / quick action shortcuts on Home screen.
class HomeCategoryScrollGrid extends StatefulWidget {
  const HomeCategoryScrollGrid({super.key, this.onPageChanged});

  final ValueChanged<int>? onPageChanged;

  @override
  State<HomeCategoryScrollGrid> createState() => _HomeCategoryScrollGridState();
}

class _HomeCategoryScrollGridState extends State<HomeCategoryScrollGrid> {
  final ScrollController _categoryScrollController = ScrollController();
  int _currentPage = 0;
  bool _isSnapping = false;
  double _dragStartOffset = 0;
  double _dragStartX = 0;

  @override
  void dispose() {
    _categoryScrollController.dispose();
    super.dispose();
  }

  Future<void> _snapToPage() async {
    if (_isSnapping || !_categoryScrollController.hasClients) return;

    final maxScroll = _categoryScrollController.position.maxScrollExtent;
    final nextPage = _categoryScrollController.offset > maxScroll / 2 ? 1 : 0;
    final targetOffset = nextPage == 1 ? maxScroll : 0.0;

    if (nextPage != _currentPage) {
      setState(() => _currentPage = nextPage);
      widget.onPageChanged?.call(nextPage);
    }
    _isSnapping = true;
    try {
      await _categoryScrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
      );
    } finally {
      _isSnapping = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 245,
      child: SizedBox(
        width: 440,
        height: _currentPage == 1 ? 188 : 103,
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification ||
                    notification is ScrollEndNotification) {
                  final nextPage = (_categoryScrollController.offset > 235)
                      ? 1
                      : 0;
                  if (nextPage != _currentPage && mounted) {
                    setState(() => _currentPage = nextPage);
                    widget.onPageChanged?.call(nextPage);
                  }
                  if (notification is ScrollEndNotification) {
                    _snapToPage();
                  }
                }
                return false;
              },
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onHorizontalDragStart: (details) {
                  _dragStartOffset = _categoryScrollController.offset;
                  _dragStartX = details.localPosition.dx;
                },
                onHorizontalDragUpdate: (details) {
                  if (!_categoryScrollController.hasClients) return;
                  final maxScroll =
                      _categoryScrollController.position.maxScrollExtent;
                  final dragDistance = details.localPosition.dx - _dragStartX;
                  final nextOffset = (_dragStartOffset - dragDistance).clamp(
                    0.0,
                    maxScroll,
                  );
                  _categoryScrollController.jumpTo(nextOffset);
                },
                onHorizontalDragEnd: (_) => _snapToPage(),
                child: SingleChildScrollView(
                  controller: _categoryScrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    width: 911,
                    height: 188,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 2,
                          child: Container(
                            width: 440,
                            height: 101,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 167,
                          top: 68,
                          child: Text(
                            'ຫຼຽນສະສົມ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 20,
                          child: Container(
                            width: 47,
                            height: 47,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/loyalty.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 252,
                          top: 68,
                          child: Text(
                            'ຈອງປີ້',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 249,
                          top: 21,
                          child: Container(
                            width: 49,
                            height: 46,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/saveaccount.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 307,
                          top: 68,
                          child: Text(
                            'ສູນຈັດສົ່ງສິນຄ້າ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 326,
                          top: 21,
                          child: Container(
                            width: 47,
                            height: 46,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/fullfilment.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 27,
                          top: 68,
                          child: Text(
                            'ร้านเดัด',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 19,
                          child: Container(
                            width: 46,
                            height: 47,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/popular_store.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 91,
                          top: 68,
                          child: Text(
                            'ດີລລາຄາດີ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 97,
                          top: 21,
                          child: Container(
                            width: 48,
                            height: 47,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/flashsale.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Payment center preview at the right edge of page 1.
                        const Positioned(
                          left: 390,
                          top: 68,
                          child: Text(
                            '\u0EAA\u0EB9\u0E99\u0E81\u0EB2\u0E99\u0E8A\u0EB3\u0EA5\u0EB0\u0EC0\u0E87\u0EB4\u0E99',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 397,
                          top: 20,
                          child: Container(
                            width: 48,
                            height: 47,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/credit.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 470,
                          top: 0,
                          child: Container(
                            width: 441,
                            height: 188,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 561,
                          top: 146,
                          child: Text(
                            'ຂອງຫລິ້ນ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 575,
                          top: 103,
                          child: Container(
                            width: 48,
                            height: 47,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/toy.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 830,
                          top: 16,
                          child: Container(
                            width: 46,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/furniture.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 828,
                          top: 64,
                          child: Text(
                            'ເຟີນີເຈີ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 640,
                          top: 64,
                          child: Text(
                            'ເສື້ອຜ້າຜູ້ຍິງ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 654,
                          top: 20,
                          child: Container(
                            width: 57,
                            height: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/women_clothes.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 759,
                          top: 64,
                          child: Text(
                            'ກິດຂະກຳກາງແຈ້ງ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 748,
                          top: 19,
                          child: Container(
                            width: 58,
                            height: 45,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/camp.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 470,
                          top: 146,
                          child: Text(
                            'ໄອທີ ແລະ ແກັດເຈັດ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 485,
                          top: 103,
                          child: Container(
                            width: 49,
                            height: 41,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/electronic.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 486,
                          top: 20,
                          child: Container(
                            width: 47,
                            height: 44,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/credit.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 489,
                          top: 64,
                          child: Text(
                            'ສູນການຊຳລະເງິນ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 575,
                          top: 16,
                          child: Container(
                            width: 42,
                            height: 45,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/live.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 561,
                          top: 64,
                          child: Text(
                            'ໄລຟ໌ສົດ',
                            style: TextStyle(
                              color: Color(0xFF151515),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: _currentPage == 1 ? 173 : 95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: index == _currentPage ? 12 : 18,
                    height: 5,
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? const Color(0xFFFB255A)
                          : const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
