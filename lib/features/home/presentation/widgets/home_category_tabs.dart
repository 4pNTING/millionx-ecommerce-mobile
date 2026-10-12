import 'package:flutter/material.dart';

/// Horizontal category tab filter bar on Home screen (ແນະນຳ, ໂປຣເປີດເທີມ, etc.).
class HomeCategoryTabs extends StatelessWidget {
  const HomeCategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
      );
  }
}
