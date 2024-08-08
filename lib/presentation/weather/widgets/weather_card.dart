import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {super.key,
      required this.weather_attr,
      required this.weather_attr_value,
      required this.weather_attr_icon});

  final String weather_attr;
  final String weather_attr_value;
  final IconData weather_attr_icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.containerBackgroundColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11, top: 19, bottom: 18),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              width: 28,
              height: 28,
              child: Icon(
                weather_attr_icon,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather_attr,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  weather_attr_value,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
