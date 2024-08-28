import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget(
      {super.key, required this.sunrise, required this.sunset});

  final String sunrise;
  final String sunset;

  String getTimeAgo(int timestamp) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final Duration difference = DateTime.now().difference(time);

    if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 0) {
      return 'in ${difference.inHours * -1}h ';
    } else {
      return '${difference.inSeconds}h ago';
    }
  }

  int parseTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);

    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 172,
          decoration: BoxDecoration(
            color: AppColor.containerBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 28,
                  height: 28,
                  child: const Icon(
                    Icons.sunny,
                    size: 16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sunrise'),
                  const SizedBox(height: 8),
                  Text(sunrise),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      getTimeAgo(parseTime(sunrise)),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 27,
        ),
        Container(
          height: 65,
          width: 172,
          decoration: BoxDecoration(
            color: AppColor.containerBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 28,
                  height: 28,
                  child: const Icon(
                    Icons.nightlight,
                    size: 16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sunset'),
                  const SizedBox(height: 8),
                  Text(sunset),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      getTimeAgo(parseTime(sunset)),
                      style: const TextStyle(fontSize: 10),
                    ),
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
