import 'package:flutter/material.dart';

/// Horizontal category navigation / quick action shortcuts on Home screen.
class HomeCategoryScrollGrid extends StatelessWidget {
  const HomeCategoryScrollGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 245,
      child: Container(
        width: 911,
        height: 188,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 2,
              child: Container(
                width: 440,
                height: 101,
                decoration: const BoxDecoration(color: Colors.white),
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
                    image: AssetImage('assets/icons/saveaccount.png'),
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
                    image: AssetImage('assets/icons/fullfilment.png'),
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
                    image: AssetImage('assets/icons/popular_store.png'),
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
            const Positioned(
              left: 400,
              top: 68,
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
              left: 407,
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
                decoration: const BoxDecoration(color: Colors.white),
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
                    image: NetworkImage("https://placehold.co/46x50.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 828,
              top: 64,
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
            const Positioned(
              left: 640,
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
              left: 654,
              top: 20,
              child: Container(
                width: 57,
                height: 44,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/57x44.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 759,
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
            Positioned(
              left: 748,
              top: 19,
              child: Container(
                width: 58,
                height: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/58x45.png"),
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
                    image: NetworkImage("https://placehold.co/49x41.png"),
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
                    image: NetworkImage("https://placehold.co/47x44.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 489,
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
            Positioned(
              left: 575,
              top: 16,
              child: Container(
                width: 42,
                height: 45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/42x45.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 561,
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
          ],
        ),
      ),
    );
  }
}
