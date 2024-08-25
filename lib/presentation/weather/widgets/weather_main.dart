import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/resources/resources.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({super.key});

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  late Future<Map<String, dynamic>> weatherData;
  DateTime now = DateTime.now();
  @override
  void initState() {
    weatherData = ApiService().getTodayWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Smth went wrong'));
        } else if (snapshot.hasData) {
          final weather = snapshot.data!;
          final weatherArray = weather['weather'];
          final temperature = weather['main']['temp'].round().toString();
          final description = weatherArray[0]['main'].toString();
          final cityName = weather['name'].toString();
          final feelsLike = weather['main']['feels_like'].round();
          final minTemp = weather['main']['temp_min'].round().toString();
          final maxTemp = weather['main']['temp_max'].round().toString();

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
                          DateFormat('MMMM d, h:mm').format(now),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "Day $maxTemp°",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Night $minTemp°",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
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
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
