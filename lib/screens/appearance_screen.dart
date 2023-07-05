import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:counter_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/config/app_config.dart';
import 'package:counter_app/styles/app_theme.dart';
import 'package:counter_app/widgets/app_bar.dart';

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
      appBar: const CustomAppBar(
        text: 'Counter App',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('Select theme mode'),
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
                return DropdownMenuItem<AppTheme>(
                  value: value,
                  child: Text(getIt<AppConfig>().toName(value)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
