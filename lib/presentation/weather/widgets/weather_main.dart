import 'package:flutter/material.dart';
import 'package:weather_app/resources/resources.dart';

class WeatherMain extends StatelessWidget {
  WeatherMain({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.description,
    required this.time,
    required this.maxTemp,
    required this.minTemp,
  });

  final String cityName;
  final String temperature;
  final String feelsLike;
  final String description;
  final String time;
  final String maxTemp;
  final String minTemp;

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
                  Text(
                    cityName,
                    style: const TextStyle(
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
                  Column(
                    children: [
                      Text(
                        temperature,
                        style: const TextStyle(
                          fontSize: 112,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        'Feels like $feelsLike°',
                        style: const TextStyle(
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
                          Text(
                            description,
                            style: const TextStyle(color: Colors.white),
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
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Max $maxTemp°",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "Min $minTemp°",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
