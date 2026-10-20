import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// Top header section (logo, location, search bar, campaign bar) on Home screen.
class HomeHeaderBar extends StatelessWidget {
  const HomeHeaderBar({super.key});

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
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 8,
              top: 51,
              child: Container(
                width: 42,
                height: 42,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/icons/logo.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 56,
              top: 59,
              child: Text(
                'COOBO',
                style: TextStyle(
                  color: const Color(0xFFF43F5E),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            Positioned(
              left: 355,
              top: 72.50,
              child: Container(
                width: 6,
                height: 6,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF151515)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 370,
              top: 64,
              child: Text(
                'ວຽງຈັນ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 101,
              child: Container(
                width: 424,
                height: 32,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: const Color(0xFF6D9CE6),
                    ),
                    borderRadius: BorderRadius.circular(21.50),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 171.05,
              top: 109,
              child: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                width: 20,
                height: 20,
              ),
            ),
            Positioned(
              left: 194.52,
              top: 104,
              child: SizedBox(
                width: 42.81,
                child: Text(
                  'ຄົ້ນຫາ',
                  style: TextStyle(
                    color: const Color(0xFF939393),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
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
            Positioned(
              left: 8,
              top: 101,
              child: SizedBox(
                width: 424,
                height: 32,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    final currentPath = GoRouter.of(context).state.uri.path;
                    if (currentPath != '/search') {
                      context.push('/search');
                    }
                  },
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
