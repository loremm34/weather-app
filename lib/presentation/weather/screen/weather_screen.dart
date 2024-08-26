import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/widgets/basic_app_button.dart';
import 'package:weather_app/presentation/weather/screen/ten_days_screen.dart';
import 'package:weather_app/presentation/weather/widgets/day_weather.dart';
import 'package:weather_app/presentation/weather/widgets/hourly_weather.dart';
import 'package:weather_app/presentation/weather/widgets/rain_chance.dart';
import 'package:weather_app/presentation/weather/widgets/sunrise_sunset.dart';
import 'package:weather_app/presentation/weather/widgets/weather_card.dart';
import 'package:weather_app/presentation/weather/widgets/weather_main.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weatherData;
  DateTime now = DateTime.now();

  @override
  void initState() {
    weatherData = ApiService().getTodayWeather();
    super.initState();
  }

  void todayWeather(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherScreen();
      }),
    );
  }

  void tomorrowWeather(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherScreen();
      }),
    );
  }

  void tenDaysWeather(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return TenDaysScreen();
      }),
    );
  }

  int toKmh(int speed) {
    return speed * 3.6.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Smth went wrong'));
            } else if (snapshot.hasData) {
              final weather = snapshot.data!;
              final weatherArray = weather['weather'];
              final temperature = weather['main']['temp'].round().toString();
              final description = weatherArray[0]['main'].toString();
              final cityName = weather['name'].toString();
              final feelsLike =
                  weather['main']['feels_like'].round().toString();
              final minTemp = weather['main']['temp_min'].round().toString();
              final maxTemp = weather['main']['temp_max'].round().toString();
              final windSpeed = weather['wind']['speed'].round();

              return Column(
                children: [
                  WeatherMain(
                    cityName: cityName,
                    temperature: temperature,
                    feelsLike: feelsLike,
                    description: description,
                    time: DateFormat('MMMM d, h:mm').format(now),
                    maxTemp: maxTemp,
                    minTemp: minTemp,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BasicAppButton(
                              title: "Today",
                              onButtonPressed: () {
                                todayWeather(context);
                              },
                            ),
                            BasicAppButton(
                              title: "Tomorrow",
                              onButtonPressed: () {
                                tomorrowWeather(context);
                              },
                            ),
                            BasicAppButton(
                              title: "10 days",
                              onButtonPressed: () {
                                tenDaysWeather(context);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            WeatherCard(
                              weatherAttr: 'Wind speed',
                              weatherAttrValue:
                                  "${toKmh(windSpeed).toString()}km/h",
                              weatherAttrIcon: Icons.wind_power,
                            ),
                            const SizedBox(width: 27),
                            WeatherCard(
                              weatherAttr: 'Rain chance',
                              weatherAttrValue: "24%",
                              weatherAttrIcon: Icons.water_drop,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            WeatherCard(
                              weatherAttr: 'Pressure',
                              weatherAttrValue: '720',
                              weatherAttrIcon: Icons.panorama_fisheye_rounded,
                            ),
                            SizedBox(width: 27),
                            WeatherCard(
                              weatherAttr: 'UV Index',
                              weatherAttrValue: '2.3',
                              weatherAttrIcon: Icons.sunny,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const HourlyWeather(),
                        const SizedBox(height: 16),
                        WeeklyWeather(),
                        const SizedBox(height: 16),
                        RainChanceWidget(),
                        const SizedBox(height: 16),
                        const SunriseSunsetWidget(),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
