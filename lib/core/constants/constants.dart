import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Unsplash API

/// API URL
const String apiUrl = 'https://api.unsplash.com';

/// API key
final apiKey = dotenv.env['CLIENT_ID'] ?? '';

/// API query parameter: per page
const int perPage = 8;
