import 'package:counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/styles/themes.dart';

// contains current theme and build version configuration
// App config singleton is registered in service_locator.dart
class AppConfig {

  AppTheme currentTheme = AppTheme.light;
  ThemeData _theme = Themes.lightTheme;
  late PackageInfo _packageInfo;

  AppConfig() {
    loadCurrentTheme();
    versionInformation();
  }

  PackageInfo get packageInfo => _packageInfo;

  Future<void> loadCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString('theme mode') ?? 'Light';
    currentTheme = currentTheme.fromName(themeName)!;
  }

  Future<void> versionInformation() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> saveThemeData(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme mode', currentTheme.toName()!);
  }
}
