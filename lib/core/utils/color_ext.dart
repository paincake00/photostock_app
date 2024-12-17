import 'package:flutter/material.dart';

/// Color extension
extension ColorExt on Color {
  static Color fromHex(String hex) {
    return Color(
      int.parse(
        '0xFF${hex.replaceAll('#', '')}',
      ),
    );
  }
}
