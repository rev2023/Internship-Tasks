import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/styles/themes.dart';
import 'package:counter_app/utils/keys.dart';

// contains current theme and build version configuration
// App config singleton is registered in service_locator.dart
class AppConfig {

  AppTheme currentTheme = AppTheme.light;
  ThemeData _theme = Themes.lightTheme;
  late String locale = 'en';
  late PackageInfo _packageInfo;

  AppConfig() {
    saveLocale();
    loadCurrentTheme();
    versionInformation();
    loadLocale();
  }

  PackageInfo get packageInfo => _packageInfo;

  Future<void> loadCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString(Keys.keyForTheme) ?? 'Light';
    currentTheme = currentTheme.fromName(themeName)!;
  }
  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
      locale = prefs.getString(Keys.keyForLanguage) ?? 'en';
  }

  Future<void> versionInformation() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> saveThemeData(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Keys.keyForTheme, currentTheme.toName()!);
  }
  Future<void> saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Keys.keyForLanguage, locale);
  }
}
