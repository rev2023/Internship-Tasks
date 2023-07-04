import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../styles/theme_mode.dart';
import '../styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme? _theme = getIt<AppConfig>().currentTheme;
  ThemeData _themeData = Themes.lightTheme;

  AppTheme? get theme => _theme;

  set theme(AppTheme? value) {
    _theme = value;
    getIt<AppConfig>().themeName = getIt<AppConfig>().toName(_theme);
    getIt<AppConfig>().saveThemeData(getIt<AppConfig>().toName(_theme));
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


