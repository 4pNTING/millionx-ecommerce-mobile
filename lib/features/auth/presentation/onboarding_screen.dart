import 'package:flutter/material.dart';
import 'login_sign_up_screen.dart'; // 1. Import หน้า Login/Sign Up เข้ามา

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    // 2. ตั้งเวลาหน่วง 1.5 วินาที (1500 มิลลิวินาที)
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        // 3. เปลี่ยนหน้าไปที่ LoginSignUpScreen (ใช้ pushReplacement เพื่อไม่ให้ย้อนกลับมาหน้า splash ได้)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginSignUpScreen(),
          ),
        );
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: // ---> เอาโค้ดจาก Figma (ที่เริ่มด้วย Container หรือ Stack) มาวางแทนที่บรรทัดนี้ทั้งหมด <---
      Container(
  width: 440,
  height: 956,
  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(color: const Color(0xFFFF0066)),
  child: Stack(
    children: [
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          width: 440,
          height: 956,
          decoration: BoxDecoration(color: const Color(0xFFF43F5E)),
        ),
      ),
      Positioned(
        left: 170,
        top: 463,
        child: Text(
          'COOBO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      Positioned(
        left: 184,
        top: 371,
        child: Container(
          width: 86,
          height: 85,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/86x85"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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