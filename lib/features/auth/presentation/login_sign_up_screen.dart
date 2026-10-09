import 'package:flutter/material.dart';
import '../../home/presentation/storefront_screen.dart'; // หรือ path ของไฟล์หน้า Home ของคุณ

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // ---> เอาโค้ดหน้า Login จาก Figma มาวางแทนที่บรรทัดนี้ทั้งหมด <---
      Container(
  width: 440,
  height: 956,
  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(color: Colors.white),
  child: Stack(
    children: [
      Positioned(
        left: 34,
        top: 384,
        child: Container(
          width: 372,
          height: 52,
          decoration: ShapeDecoration(
            color: const Color(0xFFF43F5E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 34,
        top: 318,
        child: Container(
          width: 372,
          height: 52,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFF43F5E),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      Positioned(
        left: 34,
        top: 258,
        child: Container(
          width: 372,
          height: 52,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFF43F5E),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      Positioned(
        left: 181,
        top: 450,
        child: Text(
          'Log In with Phone Number',
          style: TextStyle(
            color: const Color(0xFF0EA5E9),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 207,
        top: 511,
        child: Text(
          'OR',
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 93,
        top: 271,
        child: Text(
          'Phone / Email /Username',
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -1.44,
          ),
        ),
      ),
      Positioned(
        left: 72,
        top: 56,
        child: Text(
          'Login / Sign up',
          style: TextStyle(
            color: const Color(0xFF0F172A),
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -1.76,
          ),
        ),
      ),
      Positioned(
        left: 93,
        top: 329,
        child: Text(
          'Password',
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -1.44,
          ),
        ),
      ),


  // 1. ปุ่ม Log In (หุ้มด้วย GestureDetector เพื่อให้กดเปลี่ยนหน้าได้)
Positioned(
  left: 34,
  top: 380, // ปรับตำแหน่ง top ให้ตรงกับดีไซน์ปุ่ม Log In ของคุณ
  child: GestureDetector(
    onTap: () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const StorefrontScreen(),
        ),
      );
    },
    child: Container(
      width: 372,
      height: 52,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: const Color(0xFFFF3B5C), // ใส่สีพื้นหลังปุ่ม Log In
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ),
),

// 2. กรอบปุ่ม Log In with Gmail
Positioned(
  left: 34,
  top: 564,
  child: Container(
    width: 372,
    height: 52,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1.50,
          color: Color(0xFFD9D9D9),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  ),
),

// 3. ข้อความ Log In with Gmail
Positioned(
  left: 145,
  top: 578,
  child: const Text(
    'Log In with Gmail',
    style: TextStyle(
      color: Color(0xFF151515),
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
  ),
),
      Positioned(
        left: 46,
        top: 578,
        child: Container(
          width: 23,
          height: 23,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/23x23"),
              fit: BoxFit.fill,
            ),
            shape: OvalBorder(),
          ),
        ),
      ),
      Positioned(
        left: 34,
        top: 624,
        child: Container(
          width: 372,
          height: 52,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: const Color(0xFFD9D9D9),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      Positioned(
        left: 127,
        top: 638,
        child: Text(
          'Log In with Facebook',
          style: TextStyle(
            color: const Color(0xFF151515),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Positioned(
        left: 45,
        top: 637,
        child: Container(
          width: 25,
          height: 25,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/25x25"),
              fit: BoxFit.cover,
            ),
            shape: OvalBorder(),
          ),
        ),
      ),
      Positioned(
        left: 52,
        top: 270,
        child: Container(
          width: 13,
          height: 13,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 2,
                color: const Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 48,
        top: 336,
        child: Container(
          width: 21,
          height: 16,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: const Color(0xFFD9D9D9),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      Positioned(
        left: 57,
        top: 342,
        child: Container(
          width: 3,
          height: 5,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
        left: 334.73,
        top: 329,
        child: Text(
          'Forgot?',
          style: TextStyle(
            color: const Color(0xFF0EA5E9),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -1.44,
          ),
        ),
      ),
      Positioned(
        left: 162,
        top: 209,
        child: SizedBox(
          width: 117,
          height: 30,
          child: Text(
            'COOBO',
            style: TextStyle(
              color: const Color(0xFFF43F5E),
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      Positioned(
        left: 181,
        top: 131,
        child: Container(
          width: 74,
          height: 72,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/74x72"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      Positioned(
        left: 14,
        top: 56,
        child: SizedBox(
          width: 26,
          height: 26,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 107,
        top: 833,
        child: Text(
          'Don’ t have an account?',
          style: TextStyle(
            color: const Color(0xFF151515),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.54,
          ),
        ),
      ),
      Positioned(
        left: 299,
        top: 833,
        child: Text(
          'Sign up',
          style: TextStyle(
            color: const Color(0xFF0284C7),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.54,
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
    ],
  ),
)
    );
  }
}