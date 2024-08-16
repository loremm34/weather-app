import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton(
      {super.key, required this.title, required this.onButtonPressed});

  final String title;
  final void Function() onButtonPressed;

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
          onPressed: onButtonPressed,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
