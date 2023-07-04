import 'package:counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/theme_mode.dart';
import '../styles/themes.dart';

// contains current theme and build version configuration
// App config singleton is registered in service_locator.dart
class AppConfig {
  String themeName = 'Light';
  AppTheme? currentTheme;
  ThemeData _theme = Themes.lightTheme;
  late PackageInfo _packageInfo;

  Map<String, AppTheme> themeMap = {
    'Light': AppTheme.light,
    'Dark': AppTheme.dark,
    'Leaf Green': AppTheme.leafGreen,
    'Fire Red': AppTheme.fireRed,
  };

  String toName(AppTheme? theme) {
    switch (theme) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.leafGreen:
        return 'Leaf Green';
      case AppTheme.fireRed:
        return 'Fire Red';
      default:
        return 'Light'; // Default to 'Light' if theme is null
    }
  }

  AppConfig() {
    loadCurrentTheme();
    versionInformation();
  }

  PackageInfo get packageInfo => _packageInfo;

  Future<void> loadCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    themeName = prefs.getString('theme mode') ?? 'Light';
    currentTheme = themeMap[themeName];
  }

  Future<void> versionInformation() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> saveThemeData(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    themeName = theme;
    await prefs.setString('theme mode', themeName);
  }
}
