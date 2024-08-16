import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class RainChanceWidget extends StatelessWidget {
  RainChanceWidget({super.key});

  final List<double> rainChances = [0.27, 0.44, 0.56, 0.88];
  final List<String> times = ["7 PM", "8 PM", "9 PM", "10 PM"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.containerBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chance of rain",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(rainChances.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(times[index], style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: rainChances[index],
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "${(rainChances[index] * 100).toInt()}%",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
