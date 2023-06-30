import 'package:get_it/get_it.dart';
import '../config/app_config.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register the AppConfig singleton
  getIt.registerSingleton<AppConfig>(AppConfig());
}
