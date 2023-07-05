import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/config/app_config.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/styles/themes.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

class TabProvider with ChangeNotifier {
  int currentTab = 0;
  void onTap(int index) {
    currentTab = index;
    notifyListeners();
  }
  @override
  notifyListeners();


}


