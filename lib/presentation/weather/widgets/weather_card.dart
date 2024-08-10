import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {super.key,
      required this.weatherAttr,
      required this.weatherAttrValue,
      required this.weatherAttrIcon});

  final String weatherAttr;
  final String weatherAttrValue;
  final IconData weatherAttrIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
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
                weatherAttrIcon,
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
                  weatherAttr,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  weatherAttrValue,
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
