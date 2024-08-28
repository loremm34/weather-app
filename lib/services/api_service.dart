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

  Future<List<double>> getWeeklyWeather(double lat, double lon) async {
    final String url =
        "$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> forecastList = data['list'];

      Map<String, List<double>> dailyTemperatures = {};

      for (var forecast in forecastList) {
        String date = forecast['dt_txt'].split(' ')[0];
        double temp = forecast['main']['temp'].toDouble();

        if (dailyTemperatures.containsKey(date)) {
          dailyTemperatures[date]!.add(temp);
        } else {
          dailyTemperatures[date] = [temp];
        }
      }

      List<double> weeklyAverages = [];
      dailyTemperatures.forEach((date, temps) {
        double averageTemp = temps.reduce((a, b) => a + b) / temps.length;
        weeklyAverages.add(averageTemp.roundToDouble());
      });

      return weeklyAverages;
    }
    return [];
  }
}
