import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final double height = 50;
  final double width = 200;
  final VoidCallback onPressed;
  final bool enableFeedback;
  final Color textColor;
  final String text;

  // Constructor
  const CounterButton({
    Key? key,
    required this.onPressed,
    required this.enableFeedback,
    required this.text,
    required this.textColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),

      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textColor),
      ),
    );
  }
}
