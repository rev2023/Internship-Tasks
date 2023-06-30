
import 'package:counter_app/styles/app_colors.dart';
import 'package:flutter/material.dart';


class ResetButton extends StatelessWidget {
  final double height = 50;
  final double width = 200;
  final VoidCallback onPressed;
  final bool enableFeedback;
  final String text;

    const ResetButton({
    Key? key,
    required this.onPressed,
    required this.enableFeedback,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    var color = currentTheme.brightness == Brightness.light  ? AppColors.resetButton : AppColors.darkModeReset;
    var textColor = currentTheme.brightness == Brightness.light  ? AppColors.darkModeText : AppColors.textColor; // set in opposite way as specifically for this button the colors would be switched


    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textColor),
      ),
    );
  }
}
