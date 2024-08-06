import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';
import 'package:weather_app/resources/resources.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.lightBackgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Weather.io'),
            Image.asset(
              Assets.logo,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
