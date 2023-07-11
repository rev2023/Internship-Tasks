import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:counter_app/provider/tab_provider.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:counter_app/router/app_router.dart';
import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:counter_app/provider/preferences_provider.dart';


main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
            create: (context) => CounterProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<FactProvider>(
          create: (context) => FactProvider(),
        ),
        ChangeNotifierProvider<TabProvider>(create: (context) => TabProvider()),
        ChangeNotifierProvider<PreferencesProvider>(create: (context) => PreferencesProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return MaterialApp.router(
      routerConfig: appRouter.config(),

      localizationsDelegates:  const [
        // Add delegates for your supported locales
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,



        // Additional delegates if needed
      ],
      supportedLocales: const [
        // List your supported locales here
        Locale('en'),
        Locale('es'),
        // Additional locales if needed
      ],
      locale: Locale(preferencesProvider.currentLocale),
      theme: themeProvider.themeData,
    );
  }
}
