import 'package:flutter/material.dart';
import 'package:weather_app/resources/resources.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(37),
              bottomRight: Radius.circular(37),
            ),
            child: Image.asset(
              Assets.topBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 470,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 23.0,
            right: 23,
            top: 58,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kharkiv, Ukraine',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 118,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Text(
                        '3°',
                        style: TextStyle(
                          fontSize: 112,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80), // Добавляем отступ сверху
                      Text(
                        'Feels like -2°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cloud,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Cloudy",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "January 18, 16:14",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "Day 3°",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Night -1°",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
