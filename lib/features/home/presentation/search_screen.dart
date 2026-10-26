import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch() {
    final query = _searchController.text.trim();
    FocusManager.instance.primaryFocus?.unfocus();
    context.pushNamed('search-results', queryParameters: {'q': query});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final scale = screenWidth / 440;

            return SingleChildScrollView(
              child: SizedBox(
                width: screenWidth,
                height: 956 * scale,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 440,
                    height: 956,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 381,
                          top: 71,
                          child: TextButton(
                            onPressed: _submitSearch,
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFFE92C42),
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'ຄົ້ນຫາ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 42,
                          top: 63,
                          child: Container(
                            width: 324,
                            height: 40,
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF5A9BFF), Color(0xFFB84DEB)],
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEDEDED),
                                borderRadius: BorderRadius.circular(22.5),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 11),
                                  const Text(
                                    'ສິນຄ້າ',
                                    style: TextStyle(
                                      color: Color(0xFF5F5F61),
                                      fontSize: 17,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 19,
                                    color: Color(0xFF666666),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 25,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE77A91),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _searchController,
                                      textInputAction: TextInputAction.search,
                                      onSubmitted: (_) => _submitSearch(),
                                      style: const TextStyle(
                                        color: Color(0xFF5F5F61),
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'ຄົ້ນຫາສິນຄ້າທີ່ທ່ານມັກ',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF969696),
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: _submitSearch,
                                    borderRadius: BorderRadius.circular(7),
                                    child: Container(
                                      width: 29,
                                      height: 27,
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        right: 9,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF9D6CF0),
                                          width: 1.4,
                                        ),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 19,
                                        color: Color(0xFF8B63E8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1,
                          top: 63,
                          child: InkWell(
                            onTap: () {
                              if (context.canPop()) {
                                context.pop();
                              } else {
                                context.go('/');
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 32,
                              height: 40,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/back.svg',
                                  width: 17,
                                  height: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 116,
                          child: SvgPicture.asset(
                            'assets/icons/history.svg',
                            width: 17,
                            height: 17,
                          ),
                        ),
                        Positioned(
                          left: 38,
                          top: 114,
                          child: Text(
                            'ປະຫວັດການຄົ້ນຫາ',
                            style: TextStyle(
                              color: const Color(0xFF9E9E9E),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 13,
                          top: 116,
                          child: SvgPicture.asset(
                            'assets/icons/delete.svg',
                            width: 16,
                            height: 17,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 245,
                          child: SvgPicture.asset(
                            'assets/icons/navigator.svg',
                            width: 16,
                            height: 16,
                          ),
                        ),
                        Positioned(
                          left: 38,
                          top: 242,
                          child: Text(
                            'ຄຳຄົ້ນຫາຍອດຮິດ',
                            style: TextStyle(
                              color: const Color(0xFF9E9E9E),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 243,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/hide.svg',
                                width: 18,
                                height: 14,
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 1,
                                height: 17,
                                color: const Color(0xFFE0E0E0),
                              ),
                              const SizedBox(width: 6),
                              SvgPicture.asset(
                                'assets/icons/sort.svg',
                                width: 18,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 148,
                          child: Container(
                            width: 56,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 156,
                          child: Text(
                            'Hoka',
                            style: TextStyle(
                              color: const Color(0xFF595959),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 189,
                          child: Container(
                            width: 113,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 197,
                          child: Text(
                            'ironing board',
                            style: TextStyle(
                              color: const Color(0xFF595959),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 178,
                          top: 189,
                          child: Container(
                            width: 49,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 190,
                          top: 197,
                          child: Text(
                            'iron',
                            style: TextStyle(
                              color: const Color(0xFF595959),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 235,
                          top: 189,
                          child: Container(
                            width: 66,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 248,
                          top: 197,
                          child: Text(
                            'Dyson',
                            style: TextStyle(
                              color: const Color(0xFF595959),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 137,
                          top: 189,
                          child: Container(
                            width: 33,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 145,
                          top: 197,
                          child: Text(
                            'iro',
                            style: TextStyle(
                              color: const Color(0xFF595959),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 77,
                          top: 148,
                          child: Container(
                            width: 86,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 91.83,
                          top: 156,
                          child: SizedBox(
                            width: 64.25,
                            child: Text(
                              'Furniture',
                              style: TextStyle(
                                color: const Color(0xFF595959),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 148,
                          child: Container(
                            width: 117,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 188,
                          top: 156,
                          child: SizedBox(
                            width: 94,
                            child: Text(
                              'iron steamer',
                              style: TextStyle(
                                color: const Color(0xFF595959),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 294,
                          top: 148,
                          child: Container(
                            width: 126,
                            height: 33,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 308,
                          top: 156,
                          child: SizedBox(
                            width: 105,
                            child: Text(
                              'iron for clothes',
                              style: TextStyle(
                                color: const Color(0xFF595959),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 311,
                          top: 197,
                          child: Text(
                            'ເພີ່ມເຕີມ',
                            style: TextStyle(
                              color: const Color(0xFF9A9A9A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 101,
                          top: 271,
                          child: Text(
                            'ຮິດ',
                            style: TextStyle(
                              color: const Color(0xFFF17B89),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 293,
                          top: 370,
                          child: Text(
                            'ເດືອນສີຟ້າ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 159,
                          top: 370,
                          child: Text(
                            'ຊັກຊັກ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 159,
                          top: 337,
                          child: Text(
                            'ເຈວອາບ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 303,
                          top: 337,
                          child: Text(
                            'Hoka',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 370,
                          child: Text(
                            'ນົກເຂົາ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 337,
                          child: Text(
                            'ຜິດຫວັງ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 304,
                          child: Text(
                            'ລ້າງ​ຮ່າງ​ກາຍ​',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 275,
                          top: 304,
                          child: Text(
                            'ເຄື່ອງເປົ່າຜົມ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 159,
                          top: 304,
                          child: Text(
                            'ເຄັກກຸ້ງ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 258,
                          top: 270,
                          child: Text(
                            'ເຈວອາບນ້ຳ Dove',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 159,
                          top: 271,
                          child: Text(
                            'ໄສ້ກອກກຸ້ງ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 271,
                          child: Text(
                            'ອາຫານຫວ່າງ',
                            style: TextStyle(
                              color: const Color(0xFF525252),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 106,
                          top: 542,
                          child: Container(
                            width: 228,
                            height: 41,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: const Color(0xFFF2F2F2),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/mic.svg',
                                  width: 14,
                                  height: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'ກົດຄ້າງເພື່ອຄົ້ນຫາດ້ວຍສຽງ',
                                  style: TextStyle(
                                    color: Color(0xFFEB2B1C),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 440,
                            height: 62,
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
                                          borderRadius: BorderRadius.circular(
                                            4.30,
                                          ),
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
                                        borderRadius: BorderRadius.circular(
                                          2.50,
                                        ),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
