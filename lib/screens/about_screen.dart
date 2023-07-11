import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/config/app_config.dart';
import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:counter_app/widgets/app_bar.dart';


@RoutePage()
class AboutScreen extends StatelessWidget {
    const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    //final aboutProvider = Provider.of<AboutProvider>(context);
    final packageInfo = getIt<AppConfig>().packageInfo;


    return  Scaffold(

      appBar: CustomAppBar(
        text: AppLocalizations.of(context)!.appbar,
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
