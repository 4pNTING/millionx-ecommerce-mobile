import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// Top header section (logo, location, search bar, campaign bar) on Home screen.
class HomeHeaderBar extends StatefulWidget {
  const HomeHeaderBar({
    super.key,
    this.initialKeyword = '',
    this.onSearchChanged,
    this.onSearchSubmitted,
  });

  final String initialKeyword;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;

  @override
  State<HomeHeaderBar> createState() => _HomeHeaderBarState();
}

class _HomeHeaderBarState extends State<HomeHeaderBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialKeyword);
  }

  @override
  void didUpdateWidget(covariant HomeHeaderBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialKeyword != _controller.text) {
      _controller.text = widget.initialKeyword;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const _fontFallback = ['NotoSansLao', 'NotoSansLaoLooped'];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: SizedBox(
        width: 440,
        height: 1960,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          width: 440,
          height: 127,
          decoration: const BoxDecoration(color: Colors.white),
        ),
      ),
      Positioned(
        left: 8,
        top: 51,
        child: Container(
          width: 42,
          height: 42,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
        ),
      ),
      Positioned(
        left: 56,
        top: 59,
        child: const Text(
          'COOBO',
          style: TextStyle(
            color: Color(0xFFF43F5E),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      Positioned(
        left: 16,
        top: 45,
        child: Image.asset('assets/icons/toy.png', height: 32),
      ),
      Positioned(
        left: 355,
        top: 72.50,
        child: Container(
          width: 6,
          height: 6,
          decoration: const ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xFF151515),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 370,
        top: 64,
        child: const Text(
          'ວຽງຈັນ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontFamilyFallback: _fontFallback,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 8,
        top: 96,
        child: Container(
          width: 424,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21.50),
            border: Border.all(
              color: const Color(0xFF6D9CE6),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  final currentPath = GoRouter.of(context).state.uri.path;
                  if (currentPath != '/search') {
                    context.push('/search');
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  onChanged: widget.onSearchChanged,
                  onSubmitted: widget.onSearchSubmitted,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1E293B),
                    fontFamily: 'Inter',
                    fontFamilyFallback: _fontFallback,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    hintText: 'ຄົ້ນຫາສິນຄ້າ...',
                    hintStyle: TextStyle(
                      color: Color(0xFF939393),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontFamilyFallback: _fontFallback,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (_controller.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                    widget.onSearchChanged?.call('');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.close_rounded, size: 18, color: Color(0xFF94A3B8)),
                  ),
                ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 7,
        top: 191,
        child: Container(
          width: 425,
          height: 54,
          decoration: ShapeDecoration(
            color: const Color(0xFFF43F5E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      Positioned(
        left: 26,
        top: 203,
        child: Text(
          'แຄມເປນ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 285,
        top: 203,
        child: Text(
          'ເບິ່ງທັງຫມົດ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 386,
        top: 208,
        child: Container(
          width: 26,
          height: 19,
          decoration: ShapeDecoration(
            color: const Color(0xFFD1343F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      Positioned(
        left: 392,
        top: 210,
        child: Text(
          '16',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
