import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final _apiKey = dotenv.env['OPENWEATHER_API_KEY'];
}
