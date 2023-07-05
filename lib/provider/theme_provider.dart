import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/config/app_config.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme _theme = getIt<AppConfig>().currentTheme;
  ThemeData _themeData = Themes.lightTheme;

  AppTheme? get theme => _theme;

  set theme(AppTheme? value) {
    _theme = value!;
    getIt<AppConfig>().currentTheme = _theme;
    getIt<AppConfig>().saveThemeData(_theme.toName()!);
    notifyListeners();
  }

  ThemeData get themeData => _themeData;


  ThemeProvider() {
    selectTheme(_theme ?? AppTheme.light);
    notifyListeners();
  }

  void selectTheme(AppTheme theme){
    switch(theme){
      case AppTheme.light:
        _themeData = Themes.lightTheme;

        break;
      case AppTheme.dark:
        _themeData = Themes.darkTheme;
        break;
      case AppTheme.leafGreen:
        _themeData =  Themes.leafGreenTheme;
        break;
      case AppTheme.fireRed:
        _themeData = Themes.fireRedTheme;

    }
  }
  @override
  notifyListeners();


}


