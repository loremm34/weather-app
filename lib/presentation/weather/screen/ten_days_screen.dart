import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';
import 'package:weather_app/common/widgets/basic_app_button.dart';

class TenDaysScreen extends StatelessWidget {
  const TenDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 260,
            color: AppColor.topWidgetBackgroundColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.3, vertical: 33),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Kharkiv, Ukraine',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        '3°',
                        style: TextStyle(
                          fontSize: 57,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'Feels like -2°',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.wb_sunny,
                        size: 80,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BasicAppButton(title: 'Today', onButtonPressed: () {}),
                      BasicAppButton(title: 'Tommorow', onButtonPressed: () {}),
                      BasicAppButton(title: 'Today', onButtonPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
