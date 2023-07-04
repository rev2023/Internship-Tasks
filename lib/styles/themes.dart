import 'package:counter_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

//Two different themes - light & dark
class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.enabledButton),
    )),
  );

  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(color: AppColors.darkPrimaryColor),
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor, // Used for appbar
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.darkModeButton),
    )),
  );
  static final ThemeData fireRedTheme = ThemeData(
    canvasColor: AppColors.redBackground,
    appBarTheme: AppBarTheme(color: AppColors.redBackground),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.redBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: AppColors.redTone,
      ),
    ),
    // Add other theme properties as needed
  );
  static final leafGreenTheme = ThemeData(
    canvasColor: AppColors.greenBackground,
    appBarTheme: AppBarTheme(color: AppColors.greenBackground),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.greenBackground),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.greenBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(AppColors.darkModeButton),
    )),
  );
}
