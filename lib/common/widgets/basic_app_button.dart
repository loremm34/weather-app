import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 5.0,
      ),
      child: SizedBox(
        width: 115,
        height: 42,
        child: ElevatedButton(
          onPressed: () {},
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
