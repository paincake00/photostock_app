import 'package:flutter/material.dart';

/// App theme data
class AppThemeData {
  /// Light theme
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff6750a4),
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
    ),
    primaryTextTheme: const TextTheme(
      titleSmall: TextStyle(
        fontFamily: 'Manrope',
      ),
      titleMedium: TextStyle(
        fontFamily: 'Manrope',
      ),
      titleLarge: TextStyle(
        fontFamily: 'Manrope',
      ),
      bodySmall: TextStyle(
        fontFamily: 'Manrope',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Manrope',
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Manrope',
      ),
    ),
    useMaterial3: true,
  );
}
