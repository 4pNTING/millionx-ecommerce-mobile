import 'package:flutter/material.dart';

/// Product feed cards displayed on Home screen.
class HomeProductFeed extends StatelessWidget {
  const HomeProductFeed({super.key, this.topOffset = 0});

  final double topOffset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: topOffset,
      child: SizedBox(
        width: 440,
        height: 1960,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 222,
              top: 1106,
              child: Container(
                width: 209,
                height: 137.07,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229.78,
              top: 1114.75,
              child: Container(
                width: 74.85,
                height: 13.61,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 239.50,
              top: 1113.78,
              child: SizedBox(
                width: 63.19,
                height: 14.58,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 307.54,
              top: 1113.78,
              child: SizedBox(
                width: 120.54,
                height: 16.53,
                child: Text(
                  'ເຂົ້າກຽບກຸ້ງລົດເຂັ້ມຂຸ້ນ...',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 231.72,
              top: 1184.74,
              child: SizedBox(
                width: 41.20,
                height: 23.33,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 277.26,
              top: 1182.80,
              child: SizedBox(
                width: 86.74,
                height: 29.16,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '69.000 ',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 232,
              top: 1211,
              child: SizedBox(
                width: 208,
                height: 18,
                child: Text(
                  'ຮ້ານນີ້ຂາຍໄປແລ້ວ 2.42 ແສນ+ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 373.54,
              top: 1188.63,
              child: SizedBox(
                width: 51.26,
                height: 14.58,
                child: Text(
                  'ແຟລັດເຊວ',
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
              left: 246.19,
              top: 1144.88,
              child: SizedBox(
                width: 192.81,
                height: 15.55,
                child: Text(
                  'ອັນດັບ 1 ສິນຄ້າຂາຍດີໝວດເຂົ້າເກຽບກຸ້ງ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 230.80,
              top: 1150.72,
              child: Container(
                width: 3.08,
                height: 6.80,
                decoration: BoxDecoration(color: const Color(0xFFD1343F)),
              ),
            ),
            Positioned(
              left: 239.01,
              top: 1152.66,
              child: Container(
                width: 3.08,
                height: 4.86,
                decoration: BoxDecoration(color: const Color(0xFFD1343F)),
              ),
            ),
            Positioned(
              left: 234.90,
              top: 1149.74,
              child: Container(
                width: 3.08,
                height: 7.78,
                decoration: BoxDecoration(color: const Color(0xFFD1343F)),
              ),
            ),
            Positioned(
              left: 229.78,
              top: 1166.27,
              child: SizedBox(
                width: 36.92,
                height: 15.55,
                child: Text(
                  'ແບບຖົງ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 222,
              top: 897,
              child: Container(
                width: 209,
                height: 209,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 222,
              top: 897,
              child: Container(
                width: 209,
                height: 209,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 431,
              top: 1105.79,
              child: Container(
                transform: Matrix4.translationValues(10.0, 20.0, 0.0)
                  ..rotateZ(3.14),
                width: 213.11,
                height: 208.79,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/213x209.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 222,
              top: 1461,
              child: Container(
                width: 206,
                height: 159.05,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 232,
              top: 1518,
              child: Container(
                width: 123,
                height: 15,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD1343F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 249.79,
              top: 1517.53,
              child: SizedBox(
                width: 169.59,
                height: 14.37,
                child: Text(
                  'ຫຼຸດລາຄາລົງທັນທີ 37 ຢວນໃນເວລາຈຳກັດ',
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
              left: 232.54,
              top: 1518.49,
              child: Container(
                width: 13.41,
                height: 13.41,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEDC22),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 229.67,
              top: 1469.62,
              child: Container(
                width: 73.78,
                height: 13.41,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 239.25,
              top: 1468.67,
              child: SizedBox(
                width: 62.28,
                height: 14.37,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 306,
              top: 1469,
              child: SizedBox(
                width: 127,
                height: 16,
                child: Text(
                  'ໂຕະຂ້າງຕຽງສະຕາຍຄຣີມ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229.67,
              top: 1490.70,
              child: SizedBox(
                width: 87.19,
                height: 16.29,
                child: Text(
                  'ມນິມອລສາມາດ...',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 231.58,
              top: 1538.61,
              child: SizedBox(
                width: 38.12,
                height: 23,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 273.71,
              top: 1536.69,
              child: SizedBox(
                width: 90.29,
                height: 28.74,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '379.000',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 232,
              top: 1564,
              child: SizedBox(
                width: 199,
                height: 19,
                child: Text(
                  'ຮ້ານນີ້ຂາຍໄປແລ້ວ 6.79 ແສນຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 240.20,
              top: 1591.31,
              child: SizedBox(
                width: 114.98,
                height: 14.37,
                child: Text(
                  'ພົບຂອງປອມຊົດໃຊ້ 10 ເທົ່າ',
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
              left: 368.07,
              top: 1542.44,
              child: SizedBox(
                width: 48.29,
                height: 14.37,
                child: Text(
                  'ແຟລັດເຊວ',
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
              left: 222,
              top: 1255,
              child: Container(
                width: 206,
                height: 206,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 428.96,
              top: 1497.73,
              child: Container(
                transform: Matrix4.translationValues(10.0, 20.0, 0.0)
                  ..rotateZ(3.14),
                width: 208.63,
                height: 278.18,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/209x278.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7.60,
              top: 1070.40,
              child: Container(
                width: 210.40,
                height: 155.60,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15.43,
              top: 1128.14,
              child: SizedBox(
                width: 170.57,
                height: 14.68,
                child: Text(
                  'ສິນຄ້າລຸ້ນດຽວກັນຣີວິວດີກວ່າ 87%',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15.43,
              top: 1079.21,
              child: Container(
                width: 91.01,
                height: 13.70,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [const Color(0xFFF5402B), const Color(0xFFF16E4E)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21,
              top: 1078,
              child: SizedBox(
                width: 89,
                height: 15,
                child: Text(
                  'ແຄມເປນຫຼຸດພິເສດ',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 110.35,
              top: 1079.21,
              child: Container(
                width: 75.35,
                height: 13.70,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 1078,
              child: SizedBox(
                width: 75,
                height: 15,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 1101,
              child: SizedBox(
                width: 142,
                height: 16,
                child: Text(
                  'ນ້ຳຢາຊັກຜ້າ OMO...',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17.39,
              top: 1166.30,
              child: SizedBox(
                width: 41.62,
                height: 23.49,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 63.38,
              top: 1164.35,
              child: SizedBox(
                width: 87.62,
                height: 29.36,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '49.000',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17.39,
              top: 1192.73,
              child: SizedBox(
                width: 177.13,
                height: 18.59,
                child: Text(
                  'ຮ້ານນີ້ຂາຍໄປແລ້ວ 5 ລ້ານ+ ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 27.17,
              top: 1149.67,
              child: SizedBox(
                width: 115.83,
                height: 14.68,
                child: Text(
                  'ຈຳກັດການຊື້ 3 ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7.60,
              top: 860,
              child: Container(
                width: 210.40,
                height: 210.40,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 2.71,
              top: 860,
              child: Container(
                width: 217.26,
                height: 214.31,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/217x214.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 226.81,
              top: 1079.39,
              child: Container(
                transform: Matrix4.translationValues(10.0, 20.0, 0.0)
                  ..rotateZ(3.14),
                width: 230.77,
                height: 227.22,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/231x227.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 157,
              top: 1170,
              child: SizedBox(
                width: 50,
                height: 15,
                child: Text(
                  'ແຟລັດເຊວ',
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
              left: 221.45,
              top: 716.55,
              child: Container(
                width: 209.55,
                height: 173.49,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229,
              top: 774,
              child: SizedBox(
                width: 174,
                height: 15,
                child: Text(
                  'ມີຜູ້ບັນທຶກ/ຖືກໃຈແລ້ວ 3.8 ໝື່ນຄົນ',
                  style: TextStyle(
                    color: const Color(0xFFF7335C),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229.25,
              top: 725.32,
              child: Container(
                width: 75.05,
                height: 13.65,
                decoration: ShapeDecoration(
                  color: const Color(0xFF22C55E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 239,
              top: 724,
              child: SizedBox(
                width: 65,
                height: 15,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 307,
              top: 724,
              child: SizedBox(
                width: 124,
                height: 17,
                child: Text(
                  'ຜ້າປູທີ່ນອນລັດມຸມສີພື້ນ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229,
              top: 747,
              child: SizedBox(
                width: 128,
                height: 16,
                child: Text(
                  'ສະຕາຍມິນິມອລ...',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 231.20,
              top: 811.09,
              child: SizedBox(
                width: 40.74,
                height: 23.39,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFF43B5D),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 276.23,
              top: 809.14,
              child: SizedBox(
                width: 85.77,
                height: 29.24,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFF43B5D),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '59,000',
                        style: TextStyle(
                          color: const Color(0xFFF43B5D),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: const Color(0xFFF43B5D),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 231,
              top: 837,
              child: SizedBox(
                width: 183,
                height: 19,
                child: Text(
                  'ຍາດຊື້ໄປແລ້ວ 1.7 ໝື່ນ+ ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 239.97,
              top: 864.70,
              child: SizedBox(
                width: 116.96,
                height: 14.62,
                child: Text(
                  'ພົບຂອງປອມຊົດໃຊ້ 10 ເທົ່າ',
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
              left: 373.54,
              top: 814.99,
              child: SizedBox(
                width: 52.20,
                height: 14.62,
                child: Text(
                  'ແຟລັດເຊວ',
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
              left: 246,
              top: 795,
              child: SizedBox(
                width: 114,
                height: 14,
                child: Text(
                  'ໃຊ້ກ່ອນ ຈ່າຍຕາມຫຼັງ',
                  style: TextStyle(
                    color: const Color(0xFF23B411),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 236.56,
              top: 799.40,
              child: Container(
                width: 1.95,
                height: 1.95,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 0.50,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 221.45,
              top: 507,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.asset(
                  'assets/images/product_1.png', // <-- ใส่ไฟล์รูปสินค้าตรงนี้
                  width: 209.55,
                  height: 209.55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 439.77,
              top: 725.50,
              child: Container(
                transform: Matrix4.translationValues(10.0, 20.0, 0.0)
                  ..rotateZ(3.14),
                width: 229.84,
                height: 226.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/230x226.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 216.58,
              top: 507,
              child: Container(
                width: 216.38,
                height: 213.44,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/216x213.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 716.55,
              child: Container(
                width: 209.55,
                height: 139.38,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17.75,
              top: 774.06,
              child: Container(
                width: 185.18,
                height: 15.59,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF43F5E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 774,
              child: SizedBox(
                width: 173,
                height: 15,
                child: Text(
                  'ຫຼຸດ 20% ເວລາຈຳກັດ | 00:37:00.0',
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
              left: 15.80,
              top: 725.32,
              child: Container(
                width: 75.05,
                height: 13.65,
                decoration: ShapeDecoration(
                  color: const Color(0xFF22C55E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 724,
              child: SizedBox(
                width: 65,
                height: 15,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 94,
              top: 724,
              child: SizedBox(
                width: 124,
                height: 17,
                child: Text(
                  'ຄີມອາບນ້ຳ Dove ຂວດ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 747,
              child: SizedBox(
                width: 69,
                height: 16,
                child: Text(
                  'ໃຫຍ່...',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 17.75,
              top: 795.50,
              child: SizedBox(
                width: 41.19,
                height: 23.39,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFF43F5E),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 63.28,
              top: 793.55,
              child: SizedBox(
                width: 86.72,
                height: 29.24,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFF43F5E),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '16,000 ',
                        style: TextStyle(
                          color: const Color(0xFFF43F5E),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 822,
              child: SizedBox(
                width: 193,
                height: 18,
                child: Text(
                  'ຮ້ານນີ້ຂາຍໄປແລ້ວ 5 ລ້ານ+ ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 159,
              top: 799,
              child: SizedBox(
                width: 40,
                height: 15,
                child: Text(
                  'ໃຊ້ຄູປອງ',
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
              left: 8,
              top: 507,
              child: Container(
                width: 209.55,
                height: 209.55,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7,
              top: 507,
              child: Container(
                width: 210.60,
                height: 208,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/211x208.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 223,
              top: 1841,
              child: Container(
                width: 215,
                height: 143,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 233,
              top: 1900,
              child: Container(
                width: 222,
                height: 16,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD1343F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 252,
              top: 1900,
              child: Text(
                'ແຄມເປນໃຫຍ່ຫຼຸດທັນທີ 6 ຢວນ | ຄືນສິນຄ້າສົ່ງຟຣີ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 231,
              top: 1850,
              child: Container(
                width: 77,
                height: 14,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 241,
              top: 1849,
              child: Text(
                'ສົ່ງຮອດມື້ອື່ນຮື',
                style: TextStyle(
                  color: const Color(0xFFFFFFFD),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 311,
              top: 1849,
              child: Text(
                'ແບຣນ: Jieliya ',
                style: TextStyle(
                  color: const Color(0xFF151515),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 231,
              top: 1872,
              child: Text(
                '(Grace) | ເທດສະການເປີດເທີມ: ໃຍຂັດຕົວ Jieliya',
                style: TextStyle(
                  color: const Color(0xFF151515),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 233,
              top: 1922,
              child: Text(
                'ລາຄາ',
                style: TextStyle(
                  color: const Color(0xFFD1343F),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 275,
              top: 1920,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'LAK',
                      style: TextStyle(
                        color: const Color(0xFFD1343F),
                        fontSize: 12,
                        fontFamily: 'Noto Sans Lao',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '12,000 ',
                      style: TextStyle(
                        color: const Color(0xFFD1343F),
                        fontSize: 18,
                        fontFamily: 'Noto Sans Lao',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 233,
              top: 1949,
              child: Text(
                'ຮ້ານນີ້ຂາຍໄປແລ້ວ 359 ໝື່ນ+ ຊິ້ນ (3.59 ລ້ານຊິ້ນ)',
                style: TextStyle(
                  color: const Color(0xFF9E9E9E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 378,
              top: 1926,
              child: Text(
                'ແຄມເປນໃຫຍ່',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              left: 223,
              top: 1626,
              child: Container(
                width: 215,
                height: 215,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 221,
              top: 1626,
              child: Container(
                width: 216,
                height: 214,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/216x214.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 6.49,
              top: 1815,
              child: Container(
                width: 212,
                height: 141,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.35,
              top: 1873.17,
              child: Container(
                width: 187.35,
                height: 15.78,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD1343F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35.09,
              top: 1873.17,
              child: SizedBox(
                width: 161.71,
                height: 14.79,
                child: Text(
                  'ຫຼຸດ 10% ເວລາຈຳກັດ | 00:55:37.8',
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
              left: 14.38,
              top: 1823.87,
              child: Container(
                width: 75.92,
                height: 13.80,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24.24,
              top: 1822.89,
              child: SizedBox(
                width: 64.09,
                height: 14.79,
                child: Text(
                  'ສິນຄ້າຍອດຮິດ',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 94.25,
              top: 1823.87,
              child: Container(
                width: 75.92,
                height: 13.80,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 104.11,
              top: 1822.89,
              child: SizedBox(
                width: 64.09,
                height: 14.79,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14.38,
              top: 1845.56,
              child: SizedBox(
                width: 238.62,
                height: 16.76,
                child: Text(
                  '[ຖົງຊັກເກີບສະຕາຍຍີ່ປຸ່ນສຳລັບຄົນຂີ້ຄ້ານ] ລຸ້ນໃໝ່',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.35,
              top: 1894.87,
              child: SizedBox(
                width: 41.94,
                height: 23.66,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 62.71,
              top: 1892.89,
              child: SizedBox(
                width: 88.29,
                height: 29.58,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '59.000 ',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.35,
              top: 1921.49,
              child: SizedBox(
                width: 166.64,
                height: 18.73,
                child: Text(
                  'ຍາດຊື້ໄປແລ້ວ 1.9 ໝື່ນ+ ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 159.33,
              top: 1898.81,
              child: SizedBox(
                width: 37.47,
                height: 14.79,
                child: Text(
                  'ໃຊ້ຄູປອງ',
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
              left: 6.49,
              top: 1603,
              child: Container(
                width: 212,
                height: 212,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4.52,
              top: 1603,
              child: Container(
                width: 213.32,
                height: 210.68,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/213x211.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 6.59,
              top: 1446,
              child: Container(
                width: 212,
                height: 141,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 26.37,
              top: 1504,
              child: Container(
                width: 198,
                height: 16,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD1343F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.76,
              top: 1504.17,
              child: SizedBox(
                width: 193.26,
                height: 14.79,
                child: Text(
                  'ສ່ວນຫຼຸດເງິນອຸດໜູນຈາກອອຟຟິດຊຽລ 60 k',
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
              left: 14,
              top: 1500.23,
              child: Container(
                width: 17.67,
                height: 20.71,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/18x21.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 127.87,
              top: 1454.87,
              child: Container(
                width: 75.92,
                height: 13.80,
                decoration: ShapeDecoration(
                  color: const Color(0xFF23B411),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137.73,
              top: 1453.89,
              child: SizedBox(
                width: 64.09,
                height: 14.79,
                child: Text(
                  'ສົ່ງຮອດມື້ອື່ນຮື',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: 1477,
              child: SizedBox(
                width: 193,
                height: 16,
                child: Text(
                  'ເຕົາລີດອາຍນ້ຳແບບພົກພາ Haier',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.45,
              top: 1525.87,
              child: SizedBox(
                width: 41.91,
                height: 23.66,
                child: Text(
                  'ລາຄາ',
                  style: TextStyle(
                    color: const Color(0xFFD1343F),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 62.77,
              top: 1523.89,
              child: SizedBox(
                width: 88.23,
                height: 29.58,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LAK',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 12,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '99.000 ',
                        style: TextStyle(
                          color: const Color(0xFFD1343F),
                          fontSize: 18,
                          fontFamily: 'Noto Sans Lao',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 1552,
              child: SizedBox(
                width: 216,
                height: 19,
                child: Text(
                  'ແບຣນຍອດຮິດ ຂາຍແລ້ວ 500+ ຊິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF9E9E9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 157.88,
              top: 1529.81,
              child: SizedBox(
                width: 83.12,
                height: 14.79,
                child: Text(
                  'ລາຄາຫຼັງຫັກເງິນອຸດໜູນ',
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
              left: 14.48,
              top: 1454.87,
              child: Container(
                width: 108.46,
                height: 13.80,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [const Color(0xFFF5402B), const Color(0xFFF16E4E)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.39,
              top: 1453.89,
              child: SizedBox(
                width: 99.59,
                height: 14.79,
                child: Text(
                  'โครงการอุดหนุนราคา',
                  style: TextStyle(
                    color: const Color(0xFFFFFFFD),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 6.59,
              top: 1234,
              child: Container(
                width: 212,
                height: 212,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4.62,
              top: 1234,
              child: Container(
                width: 213.32,
                height: 210.68,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/213x211.png"),
                    fit: BoxFit.cover,
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
