import 'package:auto_route/auto_route.dart';
import 'package:counter_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';

import '../about_provider.dart';


@RoutePage()
class AboutScreen extends StatelessWidget {
    const AboutScreen({super.key});

  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final aboutProvider = Provider.of<AboutProvider>(context);
    final packageInfo = aboutProvider.packageInfo;

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
            title: Text('Version: ${packageInfo?.version ?? ''}'),
            // trailing: Switch(value: themeProvider.isDarkMode,
            //   onChanged: (value) {
            //     themeProvider.toggleTheme();
            //
            //   },),
          ),
          ListTile(
            title: Text('Build number: ${packageInfo?.buildNumber ?? ''}'),
            // trailing: Switch(value: themeProvider.isDarkMode,
            //   onChanged: (value) {
            //     themeProvider.toggleTheme();
            //
            //   },),
          ),
        ],
      ),
    );
  }
}
