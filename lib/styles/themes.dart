import 'package:counter_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

//Two different themes - light & dark
class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor, // Used for appbar
    // colorScheme: ColorScheme.light(
    //   primary: AppColors.darkModeText, //Used for text color
    //   onSurface: AppColors.textColor,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.enabledButton),)


    ),

  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor, // Used for appbar
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.darkModeButton),)

    ),
  );

}
