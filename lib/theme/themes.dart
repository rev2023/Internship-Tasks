import 'package:counter_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

//Two different themes - light & dark
class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor, // Used for appbar
    colorScheme: ColorScheme.light(
      primary: AppColors.darkModeText, //Used for text color
      onSurface: AppColors.textColor,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.enabledButton, //Used for increase & decrease button theming
        onSurface: AppColors.resetButton, //Used for reset button theming
      ),

    ),

  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor, //Used for appbar
    colorScheme: ColorScheme.dark(
      primary: AppColors.textColor, //Used for text color
      onSurface: AppColors.darkModeText,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkModeButton, //Used for increase & decrease button theming
        onSurface: AppColors.darkModeReset, //Used for reset button theming

      ),

    ),
  );
}

