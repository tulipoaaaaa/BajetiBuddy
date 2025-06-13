import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get devApiUrl => dotenv.env['DEV_API_URL'] ?? 'https://dev.api.example.com';
  static String get prodApiUrl => dotenv.env['PROD_API_URL'] ?? 'https://api.example.com';

  static Future<void> load() async {
    await dotenv.load();
    // TODO: adjust for build flavors or dev/prod modes
  }
}
