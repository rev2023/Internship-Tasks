import 'package:counter_app/counter_view_model.dart';
import 'package:counter_app/theme_provider.dart';
import 'package:counter_app/routes/app_router.dart';
import 'package:counter_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_provider.dart';


  main(){
  runApp(
    MultiProvider(

      providers: [
        ChangeNotifierProvider<CounterViewModel>(
          create: (context) => CounterViewModel(),
        ),
          ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<AboutProvider>(
          create: (context) => AboutProvider(),
        ),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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



