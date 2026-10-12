import 'package:flutter/material.dart';

class HomeNewUserPromoBar extends StatelessWidget {
  const HomeNewUserPromoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 793,
      child: SizedBox(
        width: 444,
        height: 57,
        child: Stack(
          children: [
            Container(
              width: 444,
              height: 57,
              decoration: const BoxDecoration(color: Color(0xCC151515)),
            ),
            Positioned(
              left: 54,
              top: 7,
              child: const Text(
                'ເຂົ້າສູ່ລະບົບແລ້ວລຸ້ນຮັບສຶດທິປະໂຫຍດຂາກການ\nຄັ້ງແລກ!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ),
            Positioned(
              left: 110,
              top: 29,
              child: Container(
                width: 92,
                height: 17,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'New User Only',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 342,
              top: 15,
              child: Container(
                width: 87,
                height: 29,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF43F5E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'ເຂົ້າສູ່ລະບົບ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
