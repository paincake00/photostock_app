import 'package:photostock_app/core/constants/constants.dart';

/// Calculator of constraints in the app
class CalculatorConstraints {
  /// Calculate constrainted width
  static double calculateConstraintedWidth(double screenWidth) {
    return (screenWidth > ScreenConstants.desktopWidthStart
            ? screenWidth * ScreenConstants.largeScreenPercentage
            : screenWidth)
        .clamp(0, ScreenConstants.maxWidth);
  }
}
