import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutProvider with ChangeNotifier {
  PackageInfo? _packageInfo;

  PackageInfo? get packageInfo => _packageInfo;

  AboutProvider() {
    loadPackageInfo();
  }

  Future<void> loadPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }
}
