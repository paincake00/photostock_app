import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Unsplash API Constants class
class UnsplashApiConstants {
  /// API URL
  static const String apiUrl = 'https://api.unsplash.com';

  /// API key
  static final apiKey = dotenv.env['CLIENT_ID'] ?? '';

  /// API query parameter: per page
  static const int perPage = 8;
}

class ScreenConstants {
  /// Small screen percentage
  static const double largeScreenPercentage = 0.9;

  /// Max width
  static const double maxWidth = 1000;

  /// Desktop width start
  static const double desktopWidthStart = 700;
}

/// Text Constants class
class TextConstants {
  /// AppBar head text
  static const String appBarHeadText = 'Photos';

  /// Go back text
  static const String goBackText = '< Back';
}
