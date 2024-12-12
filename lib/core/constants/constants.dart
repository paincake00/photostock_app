import 'package:flutter_dotenv/flutter_dotenv.dart';

const String apiUrl = 'https://api.unsplash.com/';
final apiKey = dotenv.env['CLIENT_ID'];
