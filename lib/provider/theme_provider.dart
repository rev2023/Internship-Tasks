import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import '../config/app_config.dart';

class ThemeProvider with ChangeNotifier {

  ThemeMode _themeMode = getIt<AppConfig>().isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
   ThemeMode get themeMode => _themeMode;
  late bool darkThemeOn;

  ThemeProvider() {
    darkThemeOn = getIt<AppConfig>().isDarkMode;
  }


  void toggleTheme() {
    if(_themeMode == ThemeMode.dark){
      darkThemeOn = false;
      _themeMode = ThemeMode.light;
      getIt<AppConfig>().isDarkMode = false;
      getIt<AppConfig>().saveThemeData(false);
    }
    else{
      darkThemeOn = true;
    _themeMode = ThemeMode.dark;
    getIt<AppConfig>().isDarkMode = true;
    getIt<AppConfig>().saveThemeData(true);

    }



    notifyListeners();
  }
}