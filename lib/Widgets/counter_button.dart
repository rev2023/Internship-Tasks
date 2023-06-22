import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  final double height = 50;
  final double width = 200;
  final VoidCallback onPressed;
  final bool enableFeedback;
  final Color color;
  String text;

  //constructor
  CounterButton({
    required this.onPressed,
    required this.enableFeedback,
    required this.color,
    required this.text,
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
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
