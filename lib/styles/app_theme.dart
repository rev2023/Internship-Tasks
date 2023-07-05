import 'package:flutter/foundation.dart';

enum AppTheme {
  light,
  dark,
  fireRed,
  leafGreen,
}
extension SelectedTheme on AppTheme {
  String get name => describeEnum(this);

  String? toName() {
    switch (name) {
      case 'light':
        return 'Light';
      case 'dark':
        return 'Dark';
      case 'fireRed':
        return 'Fire red';
      case 'leafGreen':
        return 'Leaf green';
      default:
        return '';
    }
  }

  AppTheme? fromName(String name) {
    switch (name) {
      case 'Light':
        return AppTheme.light;
      case 'Dark':
        return AppTheme.dark;
      case 'Fire red':
        return AppTheme.fireRed;
      case 'Leaf green':
        return AppTheme.leafGreen;
      default:
        return AppTheme.light;
    }
  }
}