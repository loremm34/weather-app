import 'package:flutter/material.dart';
import 'package:weather_app/common/widgets/basic_app_button.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicAppButton(title: "TOday"),
        BasicAppButton(title: "Tomorrow"),
        BasicAppButton(title: "10 days"),
      ],
    );
  }
}
