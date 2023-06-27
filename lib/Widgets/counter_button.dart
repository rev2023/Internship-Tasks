import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final double height = 50;
  final double width = 200;
  final VoidCallback onPressed;
  final bool enableFeedback;
  final Color color;
  final Color textColor;
  final String text;

  //constructor
  const CounterButton({super.key,
    required this.onPressed,
    required this.enableFeedback,
    required this.color,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      enableFeedback: enableFeedback,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textColor,)
      ),
    );
  }
}
