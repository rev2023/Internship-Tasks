import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/config/app_config.dart';


class PreferencesProvider with ChangeNotifier {
  String currentLanguage = getIt<AppConfig>().locale == 'es' ? 'English' : 'Spanish';
  void onTap(String value) {
    currentLanguage  =  value == 'English' ? 'en' : 'es';
    getIt<AppConfig>().locale = currentLanguage;
    getIt<AppConfig>().saveLocale();
    notifyListeners();
  }
  @override
  notifyListeners();


}


