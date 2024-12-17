import 'package:flutter/material.dart';

/// App text style
enum AppTextStyle {
  titleSmall(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ),
  titleMedium(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
  ),
  titleLargeW500(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  titleLargeW700(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  bodyMedium(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  bodyLarge(
    TextStyle(
      fontFamily: 'Manrope',
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
