import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String? apiKey = dotenv.env['OPENWEATHER_API_KEY'];
  final String baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<Map<String, dynamic>> getTodayWeather() async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=53.89&units=metric&lon=27.56&appid=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  Future<Map<String, dynamic>> getHourlyWeather(double lat, double lon) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/forecast?$lat=33&$lon=55&units=metric&appid=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }
}
