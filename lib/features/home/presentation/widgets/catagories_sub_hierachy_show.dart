import 'package:flutter/material.dart';

class CategoriesSubHierarchyShow extends StatelessWidget {
  const CategoriesSubHierarchyShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 440,
          height: 888,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 439,
                  height: 175,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 9,
                top: 68,
                child: SizedBox(
                  width: 85,
                  child: Text(
                    'ເຄື່ອງດື່ມແອລກໍຮໍ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 106,
                top: 68,
                child: SizedBox(
                  width: 55,
                  child: Text(
                    'ອາຫານເສີມ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 201,
                top: 68,
                child: SizedBox(
                  width: 47,
                  child: Text(
                    'ຂະໜົມ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 68,
                child: SizedBox(
                  width: 99,
                  child: Text(
                    'ນົມ ແລະ ເຄື່ອງດື່ມຊົງ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 358,
                top: 68,
                child: SizedBox(
                  width: 88,
                  child: Text(
                    'ອາຫານສໍາເລັດຮູບ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 149,
                child: SizedBox(
                  width: 74,
                  child: Text(
                    'ສະໝຸນໄພບຳລຸງ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 86,
                top: 149,
                child: SizedBox(
                  width: 96,
                  child: Text(
                    'ຖົ່ວ ແລະ ໄມ້ອົບແຫ້ງ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 186,
                top: 149,
                child: SizedBox(
                  width: 87,
                  height: 26,
                  child: Text(
                    'ຄຸກກີ້ ແລະ ເບເກີຣີ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 278,
                top: 149,
                child: SizedBox(
                  width: 100,
                  child: Text(
                    'ສິນຄ້າກະເສດທ້ອງຖິ່ນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 391,
                top: 149,
                child: SizedBox(
                  width: 22,
                  child: Text(
                    'ຊາ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 4,
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/55x55"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 103,
                top: 7,
                child: Container(
                  width: 58,
                  height: 59,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/58x59"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 193.12,
                top: 10,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 280.72,
                top: 10,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 368.33,
                top: 10,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15.93,
                top: 89,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 105.52,
                top: 89,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 193.12,
                top: 89,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 279.73,
                top: 89,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 370.32,
                top: 89,
                child: Container(
                  width: 52.76,
                  height: 53,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/53x53"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 183,
                child: Container(
                  width: 439,
                  height: 61,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 33.85,
                top: 197,
                child: SizedBox(
                  width: 51.76,
                  child: Text(
                    'ຈັດອັນດັບ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 229.95,
                top: 197,
                child: SizedBox(
                  width: 120.45,
                  child: Text(
                    'ສິນຄ້າຄຸນນະພາບຄັດສັນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15.93,
                top: 203,
                child: Container(
                  width: 2.99,
                  height: 7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, 0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [
                        const Color(0xFFF2D38B),
                        const Color(0xFFE3C064),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19.91,
                top: 201,
                child: Container(
                  width: 2.99,
                  height: 9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, 0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [
                        const Color(0xFFF2D38B),
                        const Color(0xFFE3C064),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24.89,
                top: 205,
                child: Container(
                  width: 2.99,
                  height: 5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, 0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [
                        const Color(0xFFF2D38B),
                        const Color(0xFFE3C064),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19.91,
                top: 196,
                child: Container(
                  width: 3.98,
                  height: 4,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, 0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [
                        const Color(0xFFF2D38B),
                        const Color(0xFFE3C064),
                      ],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 247,
                top: 217,
                child: SizedBox(
                  width: 89,
                  child: Text(
                    'ສິນຄ້າທີ່ເລືອກ',
                    style: TextStyle(
                      color: const Color(0xFF9F9F9F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 34.84,
                top: 217,
                child: SizedBox(
                  width: 63.71,
                  child: Text(
                    'ອັບເດດທຸກມື້',
                    style: TextStyle(
                      color: const Color(0xFF9F9F9F),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 101.54,
                top: 194,
                child: Container(
                  width: 39.82,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 145.34,
                top: 194,
                child: Container(
                  width: 39.82,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 350.41,
                top: 194,
                child: Container(
                  width: 39.82,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 394.21,
                top: 194,
                child: Container(
                  width: 39.82,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/40x40"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 226.97,
                top: 500,
                child: SizedBox(
                  width: 101.54,
                  child: Text(
                    'ລູກຄ້າຊື້ຊ້ຳ 166 ຄົນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 251,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 470,
                child: Container(
                  width: 218.01,
                  height: 98,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 67.69,
                top: 480,
                child: Container(
                  width: 29.86,
                  height: 15,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF29292B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 71.67,
                top: 481,
                child: SizedBox(
                  width: 25.88,
                  height: 11,
                  child: Text(
                    'ແບຣນ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6.97,
                top: 480,
                child: Container(
                  width: 57.74,
                  height: 15,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [
                        const Color(0xFFE44736),
                        const Color(0xFFEC795E),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9.95,
                top: 481,
                child: SizedBox(
                  width: 52.76,
                  height: 9,
                  child: Text(
                    'ໂປຣຫຼຸດພິເສດ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102.53,
                top: 480,
                child: SizedBox(
                  width: 107.51,
                  child: Text(
                    'ເຂົ້າກຽບກຸ້ງທີ່ມີ16ອັນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 7.96,
                top: 500,
                child: SizedBox(
                  width: 89.59,
                  child: Text(
                    'ຣີວິວດີ 81ພັນຄົນ',
                    style: TextStyle(
                      color: const Color(0xFFC63A34),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 500,
                child: SizedBox(
                  width: 120,
                  child: Text(
                    'ຈັດສົ່ງຈາກຮ້ານທາງການ',
                    style: TextStyle(
                      color: const Color(0xFF9D763B),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 7.96,
                top: 544,
                child: SizedBox(
                  width: 125.43,
                  child: Text(
                    'ຍອດຊື້ຊ້ຳລວມ13ພັນຊິ້ນ',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9.95,
                top: 524,
                child: SizedBox(
                  width: 100.54,
                  child: Text(
                    'ພຽງແຕ່ 59,400K ',
                    style: TextStyle(
                      color: const Color(0xFFCF332E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 112.49,
                top: 524,
                child: SizedBox(
                  width: 98.55,
                  child: Text(
                    'Fight the order',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 251,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 251,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 470,
                child: Container(
                  width: 218.01,
                  height: 98,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 289.68,
                top: 480,
                child: Container(
                  width: 29.86,
                  height: 15,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF29292B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 293.67,
                top: 481,
                child: SizedBox(
                  width: 25.88,
                  height: 11,
                  child: Text(
                    'ແບຣນ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 228.96,
                top: 480,
                child: Container(
                  width: 57.74,
                  height: 15,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [
                        const Color(0xFFE44736),
                        const Color(0xFFEC795E),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231.95,
                top: 481,
                child: SizedBox(
                  width: 52.76,
                  height: 9,
                  child: Text(
                    'ໂປຣຫຼຸດພິເສດ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 324.52,
                top: 480,
                child: SizedBox(
                  width: 107.51,
                  child: Text(
                    'ເຂົ້າກຽບກຸ້ງທີ່ມີ16ອັນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 229.95,
                top: 500,
                child: SizedBox(
                  width: 89.59,
                  child: Text(
                    'ຣີວິວດີ 81ພັນຄົນ',
                    style: TextStyle(
                      color: const Color(0xFFC63A34),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 320,
                top: 500,
                child: SizedBox(
                  width: 119,
                  child: Text(
                    'ຈັດສົ່ງຈາກຮ້ານທາງການ',
                    style: TextStyle(
                      color: const Color(0xFF9D763B),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 229.95,
                top: 544,
                child: SizedBox(
                  width: 125.43,
                  child: Text(
                    'ຍອດຊື້ຊ້ຳລວມ13ພັນຊິ້ນ',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231.95,
                top: 524,
                child: SizedBox(
                  width: 100.54,
                  child: Text(
                    'ພຽງແຕ່ 59,400K ',
                    style: TextStyle(
                      color: const Color(0xFFCF332E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334.48,
                top: 524,
                child: SizedBox(
                  width: 98.55,
                  child: Text(
                    'Fight the order',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 571,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 790,
                child: Container(
                  width: 218.01,
                  height: 98,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 67.69,
                top: 800,
                child: Container(
                  width: 29.86,
                  height: 15,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF29292B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 71.67,
                top: 801,
                child: SizedBox(
                  width: 25.88,
                  height: 11,
                  child: Text(
                    'ແບຣນ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6.97,
                top: 800,
                child: Container(
                  width: 57.74,
                  height: 15,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [
                        const Color(0xFFE44736),
                        const Color(0xFFEC795E),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9.95,
                top: 801,
                child: SizedBox(
                  width: 52.76,
                  height: 9,
                  child: Text(
                    'ໂປຣຫຼຸດພິເສດ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102.53,
                top: 800,
                child: SizedBox(
                  width: 107.51,
                  child: Text(
                    'ເຂົ້າກຽບກຸ້ງທີ່ມີ16ອັນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 7.96,
                top: 820,
                child: SizedBox(
                  width: 89.59,
                  child: Text(
                    'ຣີວິວດີ 81ພັນຄົນ',
                    style: TextStyle(
                      color: const Color(0xFFC63A34),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 820,
                child: SizedBox(
                  width: 124,
                  child: Text(
                    'ຈັດສົ່ງຈາກຮ້ານທາງການ',
                    style: TextStyle(
                      color: const Color(0xFF9D763B),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 7.96,
                top: 864,
                child: SizedBox(
                  width: 125.43,
                  child: Text(
                    'ຍອດຊື້ຊ້ຳລວມ13ພັນຊິ້ນ',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9.95,
                top: 844,
                child: SizedBox(
                  width: 100.54,
                  child: Text(
                    'ພຽງແຕ່ 59,400K ',
                    style: TextStyle(
                      color: const Color(0xFFCF332E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 112.49,
                top: 844,
                child: SizedBox(
                  width: 98.55,
                  child: Text(
                    'Fight the order',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 571,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 571,
                child: Container(
                  width: 218.01,
                  height: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/218x219"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 221.99,
                top: 790,
                child: Container(
                  width: 218.01,
                  height: 98,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 289.68,
                top: 800,
                child: Container(
                  width: 29.86,
                  height: 15,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF29292B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 293.67,
                top: 801,
                child: SizedBox(
                  width: 25.88,
                  height: 11,
                  child: Text(
                    'ແບຣນ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 228.96,
                top: 800,
                child: Container(
                  width: 57.74,
                  height: 15,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [
                        const Color(0xFFE44736),
                        const Color(0xFFEC795E),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231.95,
                top: 801,
                child: SizedBox(
                  width: 52.76,
                  height: 9,
                  child: Text(
                    'ໂປຣຫຼຸດພິເສດ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 324.52,
                top: 800,
                child: SizedBox(
                  width: 107.51,
                  child: Text(
                    'ເຂົ້າກຽບກຸ້ງທີ່ມີ16ອັນ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 229.95,
                top: 820,
                child: SizedBox(
                  width: 89.59,
                  child: Text(
                    'ຣີວິວດີ 81ພັນຄົນ',
                    style: TextStyle(
                      color: const Color(0xFFC63A34),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 320,
                top: 820,
                child: SizedBox(
                  width: 120,
                  child: Text(
                    'ຈັດສົ່ງຈາກຮ້ານທາງການ',
                    style: TextStyle(
                      color: const Color(0xFF9D763B),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 229.95,
                top: 864,
                child: SizedBox(
                  width: 125.43,
                  child: Text(
                    'ຍອດຊື້ຊ້ຳລວມ13ພັນຊິ້ນ',
                    style: TextStyle(
                      color: const Color(0xFF969696),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 231.95,
                top: 844,
                child: SizedBox(
                  width: 100.54,
                  child: Text(
                    'ພຽງແຕ່ 59,400K ',
                    style: TextStyle(
                      color: const Color(0xFFCF332E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 334.48,
                top: 844,
                child: SizedBox(
                  width: 98.55,
                  child: Text(
                    'Fight the order',
                    style: TextStyle(
                      color: const Color(0xFF969696),
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
      ],
    );
  }
}
