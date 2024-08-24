import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final _apiKey = dotenv.env['OPENWEATHER_API_KEY'];
  final String _baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<Map<String, dynamic>> getTodayWeather(double lon, double lat) async {
    final String url =
        "$_baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=$_apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  Future<Map<String, dynamic>> getHourlyWeather(double lon, double lat) async {
    final String url =
        "$_baseUrl/onecall?lat=$lat&lon=$lon&exclude=minutely,daily,alerts&units=metric&appid=$_apiKey";

    final response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }
}
