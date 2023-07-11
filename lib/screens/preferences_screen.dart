import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String? dropdownValue;
  List<String> languageList = ['English', 'Spanish'];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppLocalizations.of(context)!.appbar,
      ),
      body: Consumer<PreferencesProvider>(
        builder: (context, preference, child) {
          dropdownValue = preference.currentLanguage;
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.preferences),
                trailing: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? value) {
                      dropdownValue = value;
                      preference.onTap(value!);
                  },
                  items: languageList.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
