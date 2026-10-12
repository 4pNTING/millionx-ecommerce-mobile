import 'package:flutter/material.dart';
<<<<<<< HEAD

class StorefrontScreen extends StatelessWidget {
  const StorefrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---> นำโค้ด UI หน้า Homepage ที่ก๊อปปี้มาจาก Figma มาวางตรงนี้ <---
              Container(
  width: 440,
  height: 2024,
  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(color: Colors.white),
  child: Stack(
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
          transform: Matrix4.translationValues(10.0, 20.0, 0.0)..rotateZ(3.14),
          width: 213.11,
          height: 208.79,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/213x209"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
          transform: Matrix4.translationValues(10.0, 20.0, 0.0)..rotateZ(3.14),
          width: 208.63,
          height: 278.18,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/209x278"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
              image: NetworkImage("https://placehold.co/217x214"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      Positioned(
        left: 226.81,
        top: 1079.39,
        child: Container(
          transform: Matrix4.translationValues(10.0, 20.0, 0.0)..rotateZ(3.14),
          width: 230.77,
          height: 227.22,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/231x227"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
          transform: Matrix4.translationValues(10.0, 20.0, 0.0)..rotateZ(3.14),
          width: 229.84,
          height: 226.30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/230x226"),
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
              image: NetworkImage("https://placehold.co/216x213"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
              image: NetworkImage("https://placehold.co/211x208"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
              image: NetworkImage("https://placehold.co/216x214"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
              image: NetworkImage("https://placehold.co/213x211"),
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
              image: NetworkImage("https://placehold.co/18x21"),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
              image: NetworkImage("https://placehold.co/213x211"),
              fit: BoxFit.cover,
            ),
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
        child: Container(
          width: 12.71,
          height: 12.47,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
          ),
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
  left: 180,
  top: 88,
  child: Image.asset('assets/icons/toy.png', width: 20, height: 20),
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
        left: 355,
        top: 72.50,
        child: Container(
          width: 6,
          height: 6,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFF151515),
              ),
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
        left: 0,
        top: 245,
        child: Container(
          width: 911,
          height: 188,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 2,
                child: Container(
                  width: 440,
                  height: 101,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 167,
                top: 68,
                child: Text(
                  'ຫຼຽນສະສົມ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/loyalty.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 252,
                top: 68,
                child: Text(
                  'ຈອງປີ້',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/saveaccount.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 307,
                top: 68,
                child: Text(
                  'ສູນຈັດສົ່ງສິນຄ້າ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/fullfilment.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 68,
                child: Text(
                  'ร้านเดัด',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/popular_store.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 91,
                top: 68,
                child: Text(
                  'ດີລລາຄາດີ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/flashsale.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 400,
                top: 68,
                child: Text(
                  'ສູນການຊຳລະເງິນ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
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
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 830,
                top: 16,
                child: Container(
                  width: 46,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/46x50"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 828,
                top: 64,
                child: Text(
                  'ຂອງຫລິ້ນ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 640,
                top: 64,
                child: Text(
                  'ກິດຂະກຳກາງແຈ້ງ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/57x44"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 759,
                top: 64,
                child: Text(
                  'ເຟີນີເຈີ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/58x45"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 470,
                top: 146,
                child: Text(
                  'ໄອທີ ແລະ ແກັດເຈັດ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/49x41"),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/47x44"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 489,
                top: 64,
                child: Text(
                  'ໄລຟ໌ສົດ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/42x45"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 561,
                top: 64,
                child: Text(
                  'ເສື້ອຜ້າຜູ້ຍິງ',
                  style: TextStyle(
                    color: const Color(0xFF151515),
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
              image: NetworkImage("https://placehold.co/62x62"),
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
              image: NetworkImage("https://placehold.co/62x62"),
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
              image: NetworkImage("https://placehold.co/62x62"),
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
              image: NetworkImage("https://placehold.co/62x62"),
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
      Positioned(
        left: 11,
        top: 143,
        child: Container(
          width: 428,
          height: 42,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: SizedBox(
                  width: 3124,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          'ແນະນຳ',
                          style: TextStyle(
                            color: const Color(0xFFF43F5E),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 75,
                        top: 0,
                        child: Text(
                          'ໂປຣເປີດເທີມ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 209,
                        top: 0,
                        child: Text(
                          'ລັດອຸດໜູນ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 327,
                        top: 0,
                        child: Text(
                          'ຂອງໃຊ້ທົ່ວໄປ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 463,
                        top: 0,
                        child: Text(
                          'ອາຫານ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 543,
                        top: 0,
                        child: Text(
                          'ເສື້ອຜ້າຜູ້ຊາຍ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 682,
                        top: 0,
                        child: Text(
                          'ເກີບ ແລະ ກະເປົາ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 844,
                        top: 0,
                        child: Text(
                          'ເຄື່ອງນອນ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 953,
                        top: 0,
                        child: Text(
                          'ສະມາດໂຟນ ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1076,
                        top: 0,
                        child: Text(
                          'ກິລາ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1128,
                        top: 0,
                        child: Text(
                          'ເສື້ອຜ້າຜູ້ຍິງ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1251,
                        top: 0,
                        child: Text(
                          'ເຄື່ອງໃຊ້ໄຟຟ້າ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1390,
                        top: 0,
                        child: Text(
                          'ສຸຂະພາບ ແລະ ຢາ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1566,
                        top: 0,
                        child: Text(
                          'ຊຸດຊັ້ນໃນ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1665,
                        top: 0,
                        child: Text(
                          'ໝາກໄມ້',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1751,
                        top: 0,
                        child: Text(
                          'ຄວາມງາມ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1851,
                        top: 0,
                        child: Text(
                          'ເຟີນີເຈີ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 1929,
                        top: 0,
                        child: Text(
                          'ຕົກແຕ່ງບ້ານ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2054,
                        top: 0,
                        child: Text(
                          'ແມ່ ແລະ ເດັກ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2190,
                        top: 0,
                        child: Text(
                          'ອຸປະກອນລົດຍົນ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2361,
                        top: 0,
                        child: Text(
                          'ເຄື່ອງປະດັບ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2485,
                        top: 0,
                        child: Text(
                          'ຄອມພິວເຕີ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2608,
                        top: 0,
                        child: Text(
                          'ສິນຄ້ານຳເຂົ້າ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2734,
                        top: 0,
                        child: Text(
                          'ບັນເທີງ ແລະ ຂອງຫຼິ້ນ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2949,
                        top: 0,
                        child: Text(
                          'ອາຫານສະເພາະທາງ ',
                          style: TextStyle(
                            color: const Color(0xFF151515),
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
              image: NetworkImage("https://placehold.co/42x42"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
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
  left: 16,
  top: 45,
  child: Image.asset('assets/icons/toy.png', height: 32),
),
      Positioned(
        left: 0,
        top: 793,
        child: Container(
          width: 444,
          height: 57,
          decoration: BoxDecoration(color: const Color(0xCC151515)),
        ),
      ),
      Positioned(
        left: 113,
        top: 820,
        child: Text(
          'New User Only',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.67,
          ),
        ),
      ),
      Positioned(
        left: 110,
        top: 822,
        child: Container(
          width: 92,
          height: 17,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      Positioned(
        left: 54,
        top: 800,
        child: Text(
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
        left: 342,
        top: 808,
        child: Container(
          width: 87,
          height: 29,
          decoration: ShapeDecoration(
            color: const Color(0xFFF43F5E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
      Positioned(
        left: 353,
        top: 812,
        child: Text(
          'ເຂົ້າສູ່ລະບົບ',
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
        left: 0,
        top: 0,
        child: Container(
          width: 440,
          height: 62,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 157.20,
                top: 14.17,
                child: Container(
                  width: 125.59,
                  height: 36.33,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 368.38,
                top: 24.99,
                child: Opacity(
                  opacity: 0.35,
                  child: Container(
                    width: 28.20,
                    height: 14.25,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(4.30),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 370.73,
                top: 27.40,
                child: Container(
                  width: 23.45,
                  height: 9.49,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 65.76,
                top: 21.45,
                child: Text(
                  '3:14',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SF Compact Display',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 0,
        top: 1990,
        child: SizedBox(
          width: 440,
          height: 34,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 440,
                  height: 34,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 298.86,
                top: 25.91,
                child: Container(
                  transform: Matrix4.translationValues(10.0, 20.0, 0.0)..rotateZ(3.14),
                  width: 157.12,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 19,
        top: 852,
        child: SizedBox(
          width: 482,
          height: 65,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 401.45,
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 5,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 155.90,
                top: 6.50,
                child: SizedBox(
                  width: 139.01,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25.98,
                        top: 0,
                        child: Container(
                          width: 25.98,
                          height: 52,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2.60,
                        top: 16.90,
                        child: Opacity(
                          opacity: 0,
                          child: Text(
                            'ຫມວດໝູ່',
                            style: TextStyle(
                              color: const Color(0xFF151515),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 218.26,
                top: 6.50,
                child: SizedBox(
                  width: 139.01,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25.98,
                        top: 0,
                        child: Container(
                          width: 25.98,
                          height: 52,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2.60,
                        top: 16.90,
                        child: Opacity(
                          opacity: 0,
                          child: Text(
                            'ໂປຣໂມຊັ່ນ',
                            style: TextStyle(
                              color: const Color(0xFF151515),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18.84,
                        top: 32.50,
                        child: Container(
                          width: 5.20,
                          height: 5.20,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1.50,
                                color: const Color(0xFF151515),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29.23,
                        top: 32.50,
                        child: Container(
                          width: 5.20,
                          height: 5.20,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1.50,
                                color: const Color(0xFF151515),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 280.63,
                top: 6.50,
                child: SizedBox(
                  width: 139.01,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25.98,
                        top: 0,
                        child: Container(
                          width: 25.98,
                          height: 52,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2.60,
                        top: 16.90,
                        child: Opacity(
                          opacity: 0,
                          child: Text(
                            'ແຊ໊ດ',
                            style: TextStyle(
                              color: const Color(0xFF151515),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 342.99,
                top: 6.50,
                child: SizedBox(
                  width: 139.01,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25.98,
                        top: 0,
                        child: Container(
                          width: 25.98,
                          height: 52,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2.60,
                        top: 16.90,
                        child: Opacity(
                          opacity: 0,
                          child: Text(
                            'ໂປຮໄຟຣ',
                            style: TextStyle(
                              color: const Color(0xFF151515),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22.09,
                        top: 16.90,
                        child: Container(
                          width: 7.80,
                          height: 7.80,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1.50,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: const Color(0xFF151515),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 6.50,
                top: 6.50,
                child: SizedBox(
                  width: 139.01,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 51.97,
                          height: 52,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(2.49, 0.51),
                              end: Alignment(-0.00, 0.51),
                              colors: [const Color(0xFFFB658D), const Color(0xFFFB255A)],
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25.98,
                        top: 0,
                        child: Container(
                          width: 113.03,
                          height: 52,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, 0.50),
                              end: Alignment(0.00, 0.50),
                              colors: [const Color(0xFFF43F5E), const Color(0xFFFB255A)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33.78,
                        top: 16.25,
                        child: SizedBox(
                          width: 19.49,
                          height: 19.50,
                          child: Stack(),
                        ),
                      ),
                      Positioned(
                        left: 63.66,
                        top: 16.90,
                        child: Text(
                          'ຫນ້າຫລັກ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
)
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../../../core/widgets/store_image.dart';
import '../../../core/widgets/store_scaffold.dart';
import '../../category/presentation/category_providers.dart';
import '../../product/domain/product.dart';
import '../../product/presentation/product_providers.dart';

class StorefrontScreen extends ConsumerStatefulWidget {
  const StorefrontScreen({super.key});
  @override
  ConsumerState<StorefrontScreen> createState() => _StorefrontScreenState();
}

class _StorefrontScreenState extends ConsumerState<StorefrontScreen> {
  final _search = TextEditingController();
  String _keyword = '';
  String? _categoryId;
  int _page = 1;
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _searchProducts() => setState(() {
    _keyword = _search.text.trim();
    _page = 1;
  });
  @override
  Widget build(BuildContext context) {
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    final categories = ref.watch(categoriesProvider);
    final filter = (keyword: _keyword, categoryId: _categoryId, page: _page);
    final products = ref.watch(productsProvider(filter));
    return StoreScaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                strings.products,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _search,
                onSubmitted: (_) => _searchProducts(),
                decoration: InputDecoration(
                  labelText: strings.search,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: _searchProducts,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              categories.when(
                data: (items) => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChoiceChip(
                      label: Text(strings.all),
                      selected: _categoryId == null,
                      onSelected: (_) => setState(() {
                        _categoryId = null;
                        _page = 1;
                      }),
                    ),
                    for (final category in items)
                      ChoiceChip(
                        label: Text(category.name),
                        selected: _categoryId == category.id,
                        onSelected: (selected) => setState(() {
                          _categoryId = selected ? category.id : null;
                          _page = 1;
                        }),
                      ),
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (error, stack) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        strings.text(
                          'Categories could not be loaded',
                          'ບໍ່ສາມາດໂຫຼດໝວດສິນຄ້າ',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref.invalidate(categoriesProvider),
                      child: Text(strings.retry),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              products.when(
                data: (result) => Column(
                  children: [
                    if (result.items.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(strings.empty),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final columns = constraints.maxWidth >= 1000
                              ? 4
                              : constraints.maxWidth >= 650
                              ? 3
                              : constraints.maxWidth >= 420
                              ? 2
                              : 1;
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: result.items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columns,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  mainAxisExtent: 340,
                                ),
                            itemBuilder: (_, index) => _ProductCard(
                              product: result.items[index],
                              strings: strings,
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: strings.text('Previous page', 'ໜ້າກ່ອນ'),
                          onPressed: _page > 1
                              ? () => setState(() => _page--)
                              : null,
                          icon: const Icon(Icons.chevron_left),
                        ),
                        Text(
                          '${result.page} / ${result.pageCount} · ${result.total}',
                        ),
                        IconButton(
                          tooltip: strings.text('Next page', 'ໜ້າຕໍ່ໄປ'),
                          onPressed: _page < result.pageCount
                              ? () => setState(() => _page++)
                              : null,
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ],
                ),
                loading: () => const Padding(
                  padding: EdgeInsets.all(60),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => RetryPanel(
                  message: '${strings.unavailable}\n$error',
                  label: strings.retry,
                  onRetry: () => ref.invalidate(productsProvider(filter)),
                ),
              ),
>>>>>>> origin/Login/signup-and-home-screen
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.strings});
  final Product product;
  final StoreStrings strings;
  @override
  Widget build(BuildContext context) {
    final image = product.images.isEmpty ? null : product.images.first;
    final price = product.startingPrice;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/products/${product.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: StoreImage(
                  url: image?.url,
                  altText: image?.altText ?? product.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price == null
                        ? strings.text('Price unavailable', 'ຍັງບໍ່ມີລາຄາ')
                        : '${price.amount.toStringAsFixed(0)} ${price.currency}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> origin/Login/signup-and-home-screen
