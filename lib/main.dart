import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:counter_app/router/app_router.dart';
import 'package:counter_app/styles/themes.dart';
import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  main(){
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

      ],
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

    MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
    routerConfig: appRouter.config(),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeProvider.themeMode,
    );

  }
}



