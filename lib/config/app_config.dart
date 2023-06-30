import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

//contains current theme and build version configuration
// App config singleton is registered in service_locator.dart
class AppConfig {
  bool _isDarkMode = false;
  late PackageInfo _packageInfo;
  bool get isDarkMode => _isDarkMode;


  AppConfig() {
    loadCurrentTheme();
    versionInformation();
  }


  set isDarkMode(bool value) {
    _isDarkMode = value;
    saveThemeData(_isDarkMode);
  }

  PackageInfo get packageInfo => _packageInfo;

  Future<void> loadCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDark') ?? false;
  }

  Future<void> versionInformation() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> saveThemeData(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDarkMode);
  }
}
