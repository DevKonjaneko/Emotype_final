import 'package:flutter/material.dart';

class AppTheme {
  // ตั้งค่าสีพื้นหลังให้เป็นโทนดาร์กม่วงโฮโลแกรม (ห้ามเป็นสีขาว)
  static const Color bgHolographic = Color(0xFF0C0916);
  static const Color cardDark = Color(0xFF16161A);
  static const Color primaryPink = Color(0xFFF472B6);
  static const Color accentPurple = Color(0xFF9333EA);

  static ThemeData holographicTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgHolographic, // ดึงสีมืดมาใช้เป็นพื้นหลังหลัก
    fontFamily: 'Kanit',
    colorScheme: const ColorScheme.dark(
      primary: primaryPink,
      secondary: accentPurple,
      surface: cardDark,
    ),
  );
}