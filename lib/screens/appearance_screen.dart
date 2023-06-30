import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_config.dart';


@RoutePage()
class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});
  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    //final themeManager = Provider.of<ThemeManager>(context);

    return  Scaffold(

          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                AutoRouter.of(context).pop();
              },
            ),
            backgroundColor: Theme.of(context).primaryColor,
            title: const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Text('Counter App'),
              ),
            ),
          ),
          body: Column(
            children:  [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text('Switch on dark mode'),
                trailing: Switch(value: themeProvider.darkThemeOn,
                  onChanged: (value) {
                   themeProvider.toggleTheme();

                },),
              ),
            ],
          ),
    );
  }
}
