import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF05B5A0);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Achiko',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
  );
}
