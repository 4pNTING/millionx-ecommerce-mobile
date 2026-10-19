import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 5,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
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
                            colors: const [Color(0xFFFB658D), Color(0xFFFB255A)],
                          ),
                          shape: const OvalBorder(),
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
                            colors: const [Color(0xFFF43F5E), Color(0xFFFB255A)],
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
                      child: const Text(
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
    );
  }
}
