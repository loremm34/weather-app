import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sunrise'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('4:20AM'),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      '4h ago',
                      style: TextStyle(
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
          width: 16,
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sunrise'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('4:20AM'),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      '4h ago',
                      style: TextStyle(
                        fontSize: 10,
                      ),
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
