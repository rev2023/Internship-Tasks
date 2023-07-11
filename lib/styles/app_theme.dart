import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


enum AppTheme {
  light,
  dark,
  fireRed,
  leafGreen,
}
extension SelectedTheme on AppTheme {
  String get name => describeEnum(this);
  String localizedName(BuildContext context){
    switch (this) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.fireRed:
        return 'Fire red';
      case AppTheme.leafGreen:
        return 'Leaf green';
      default:
        throw Exception('Invalid theme from toName()');
    }
  }

  String toName() {
    switch (this) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.fireRed:
        return 'Fire red';
      case AppTheme.leafGreen:
        return 'Leaf green';
      default:
        throw Exception('Invalid theme from toName()');
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