import 'package:flutter/material.dart';
import 'package:weather_app/presentation/weather/widgets/weather_details.dart';
import 'package:weather_app/presentation/weather/widgets/weather_main.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherMain(),
            WeatherDetails(
              title: 'Today',
            ),
          ],
        ),
      ),
    );
  }
}
