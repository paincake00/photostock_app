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
    useMaterial3: true,
  );
}
