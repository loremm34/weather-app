import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/widgets/basic_app_button.dart';
import 'package:weather_app/presentation/weather/widgets/day_weather.dart';
import 'package:weather_app/presentation/weather/widgets/hourly_weather.dart';
import 'package:weather_app/presentation/weather/widgets/rain_chance.dart';
import 'package:weather_app/presentation/weather/widgets/weather_card.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.3, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BasicAppButton(title: title),
                BasicAppButton(title: "Tomorrow"),
                BasicAppButton(title: "10 days"),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                WeatherCard(
                  weatherAttr: 'Wind speed',
                  weatherAttrValue: "12km/h",
                  weatherAttrIcon: Icons.wind_power,
                ),
                SizedBox(width: 16),
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
                SizedBox(width: 16),
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
            DayWeather(),
            const SizedBox(height: 16),
            RainChanceWidget(),
          ],
        ),
      ),
    );
  }
}
