import 'package:counter_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

//Two different themes - light & dark
class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.enabledButton),)


    ),

  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.darkPrimaryColor),
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor, // Used for appbar
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.darkModeButton),)

    ),
  );

}
