import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        width: 380,
        height: 180,
        decoration: BoxDecoration(
          color: AppColor.containerBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 28,
                    height: 28,
                    child: const Icon(
                      Icons.watch_later_outlined,
                      size: 16,
                    ),
                  ),
                ),
                const Text(
                  'Hourly forecast',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 7.0, left: 10.0),
                    child: Column(
                      children: [
                        Text(
                          '10am',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Icon(Icons.cloud, size: 30),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '10°',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
