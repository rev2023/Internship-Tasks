import 'package:counter_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
class Themes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.enabledButton = Colors.black26,
      textTheme: ButtonTextTheme.primary,
    ),
    buttonColor: AppColors.resetButton = Colors.white24,
    primaryColor: AppColors.textColor =  Colors.white,


    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.grey[900], // Example button color
    //   textTheme: ButtonTextTheme.primary, // Example text color
    // ),
    //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),


    // Set other properties for dark mode such as colors, text styles, etc.
  );
}