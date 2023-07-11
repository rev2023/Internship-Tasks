import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/config/app_config.dart';


class PreferencesProvider with ChangeNotifier {
  String currentLocale = getIt<AppConfig>().locale;
  String currentLanguage= getIt<AppConfig>().locale == 'es' ? 'Spanish' : 'English';
  void onTap(String value) {
    currentLocale  =  value == 'English' ? 'en' : 'es';
    currentLanguage = currentLocale == 'en' ? 'English' : 'Spanish';
    getIt<AppConfig>().locale = currentLocale;
    getIt<AppConfig>().saveLocale();
    notifyListeners();
  }
  @override
  notifyListeners();


}


