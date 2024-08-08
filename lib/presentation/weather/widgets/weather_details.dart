import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/widgets/basic_app_button.dart';
import 'package:weather_app/presentation/weather/widgets/weather_card.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.3),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicAppButton(title: "Today"),
              BasicAppButton(title: "Tomorrow"),
              BasicAppButton(title: "10 days"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              WeatherCard(
                weather_attr: 'Wind speed',
                weather_attr_value: "12km/h",
                weather_attr_icon: Icons.wind_power,
              ),
              SizedBox(width: 16),
              WeatherCard(
                weather_attr: 'Rain chance',
                weather_attr_value: "24%",
                weather_attr_icon: Icons.water_drop,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              WeatherCard(
                weather_attr: 'Pressure',
                weather_attr_value: '720',
                weather_attr_icon: Icons.panorama_fisheye_rounded,
              ),
              SizedBox(width: 16),
              WeatherCard(
                weather_attr: 'UV Index',
                weather_attr_value: '2.3',
                weather_attr_icon: Icons.sunny,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
