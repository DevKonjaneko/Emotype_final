import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const EmotypeApp());
}

class EmotypeApp extends StatelessWidget {
  const EmotypeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotype',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.holographicTheme, // เรียกใช้งานธีมกลาง
      home: const SplashScreen(),
    );
  }
}