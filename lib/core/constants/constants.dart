import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API URL
const String apiUrl = 'https://api.unsplash.com';

/// API key
final apiKey = dotenv.env['CLIENT_ID'];
