import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 1. Import ตัวนี้เข้ามา
import 'features/auth/presentation/onboarding_screen.dart'; // บรรทัดนี้ที่ขาดไป

void main() {
  runApp(
    // 2. ห่อหุ้มแอปทั้งหมดด้วย ProviderScope
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: const OnboardingScreen(),
    );
  }
}