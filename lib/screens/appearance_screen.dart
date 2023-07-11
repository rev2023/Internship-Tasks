import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  AppTheme? dropdownValue;

  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    List<AppTheme> list = AppTheme.values.toList();
    dropdownValue = themeProvider.theme;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    List<AppTheme> list = AppTheme.values.toList();

    return Scaffold(
      appBar: CustomAppBar(
        text: AppLocalizations.of(context)!.appbar,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.select),
            trailing: DropdownButton<AppTheme>(
              value: dropdownValue,
              onChanged: (AppTheme? value) {
                setState(() {
                  themeProvider.selectTheme(value!);
                  themeProvider.theme = value;
                  dropdownValue = value;
                });
              },
              items: list.map<DropdownMenuItem<AppTheme>>((AppTheme value) {
                String getOption(AppTheme name) {
                  switch (name) {
                    case AppTheme.light:
                      return AppLocalizations.of(context)!.light;
                    case AppTheme.dark:
                      return AppLocalizations.of(context)!.dark;
                    case AppTheme.fireRed:
                      return AppLocalizations.of(context)!.firered;
                    case AppTheme.leafGreen:
                      return AppLocalizations.of(context)!.leafgreen;
                    default:
                      return AppLocalizations.of(context)!.light;
                  }
                }

                return DropdownMenuItem<AppTheme>(
                  value: value,
                  child: Text(getOption(value)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
