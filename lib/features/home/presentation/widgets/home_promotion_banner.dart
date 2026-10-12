import 'package:flutter/material.dart';

/// Promotion & subsidized deals banner card on Home screen.
class HomePromotionBanner extends StatelessWidget {
  const HomePromotionBanner({super.key});

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
        left: 8,
        top: 348,
        child: Container(
          width: 423,
          height: 150.71,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEF5F6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      Positioned(
        left: 8,
        top: 348,
        child: Container(
          width: 112,
          height: 101,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
        ),
      ),
      Positioned(
        left: -40,
        top: 303,
        child: Container(
          width: 108,
          height: 114,
          decoration: ShapeDecoration(
            gradient: RadialGradient(
              center: Alignment(0.50, 0.50),
              radius: 0.50,
              colors: [const Color(0xFFF73772), Colors.white.withValues(alpha: 0)],
            ),
            shape: OvalBorder(),
          ),
        ),
      ),
      Positioned(
        left: 14.03,
        top: 382.16,
        child: Container(
          width: 100.48,
          height: 109.52,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 33.12,
        top: 391.20,
        child: Container(
          width: 62.29,
          height: 62.29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/62x62.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        left: 25.08,
        top: 454.50,
        child: SizedBox(
          width: 77.37,
          height: 17.08,
          child: Text(
            'LAK13.000',
            style: TextStyle(
              color: const Color(0xFFF43F5E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Positioned(
        left: 40.15,
        top: 471.58,
        child: SizedBox(
          width: 47.22,
          height: 17.08,
          child: Text(
            'ເປົາຊຸບເປີ້',
            style: TextStyle(
              color: const Color(0xFF8A623E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Positioned(
        left: 117.52,
        top: 382.16,
        child: Container(
          width: 100.48,
          height: 109.52,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 133.59,
        top: 390.20,
        child: Container(
          width: 62.29,
          height: 62.29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/62x62.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        left: 143.64,
        top: 471.58,
        child: SizedBox(
          width: 47.22,
          height: 17.08,
          child: Text(
            'ເປົາຊຸບເປີ້',
            style: TextStyle(
              color: const Color(0xFF8A623E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Positioned(
        left: 128.57,
        top: 454.50,
        child: SizedBox(
          width: 77.37,
          height: 17.08,
          child: Text(
            'LAK13.000',
            style: TextStyle(
              color: const Color(0xFFF43F5E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Positioned(
        left: 220,
        top: 382.16,
        child: Container(
          width: 100.48,
          height: 109.52,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 239.09,
        top: 390.20,
        child: Container(
          width: 62.29,
          height: 62.29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/62x62.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        left: 246.13,
        top: 471.58,
        child: SizedBox(
          width: 47.22,
          height: 17.08,
          child: Text(
            'ເປົາຊຸບເປີ້',
            style: TextStyle(
              color: const Color(0xFF8A623E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Positioned(
        left: 231.05,
        top: 454.50,
        child: SizedBox(
          width: 77.37,
          height: 17.08,
          child: Text(
            'LAK13.000',
            style: TextStyle(
              color: const Color(0xFFF43F5E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Positioned(
        left: 322.49,
        top: 382.16,
        child: Container(
          width: 100.48,
          height: 109.52,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 341.58,
        top: 390.20,
        child: Container(
          width: 62.29,
          height: 62.29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/62x62.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        left: 348.61,
        top: 471.58,
        child: SizedBox(
          width: 47.22,
          height: 17.08,
          child: Text(
            'ເປົາຊຸບເປີ້',
            style: TextStyle(
              color: const Color(0xFF8A623E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      Positioned(
        left: 333.54,
        top: 454.50,
        child: SizedBox(
          width: 77.37,
          height: 17.08,
          child: Text(
            'LAK13.000',
            style: TextStyle(
              color: const Color(0xFFF43F5E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Positioned(
        left: 18.05,
        top: 352.02,
        child: SizedBox(
          width: 115.55,
          height: 29.14,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'ສິນຄ້າ',
                  style: TextStyle(
                    color: const Color(0xFFF43F5E),
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: const Color(0xFFF73772),
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'ພິເສດ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 154.69,
        top: 358.05,
        child: SizedBox(
          width: 85.40,
          height: 17.08,
          child: Text(
            'ອຸດໜູນໝື່ນລ້ານ',
            style: TextStyle(
              color: const Color(0xFFC37207),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
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
