import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemOnePressed;
  final VoidCallback onDrawerItemTwoPressed;
  final VoidCallback onDrawerItemThreePressed;

  const CustomDrawer({
    Key? key,
    required this.onDrawerItemOnePressed,
    required this.onDrawerItemTwoPressed,
    required this.onDrawerItemThreePressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white24,
                border: Border(
                  bottom: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.blueAccent,
                    width: 2.5,
                  ),
                ),
              ),
              child: Row(
                children:  [
                  Text(
                      AppLocalizations.of(context)!.settings,
                    style: const TextStyle(fontSize: 18.5),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.settings),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.appearance),
            onTap: () {
              onDrawerItemOnePressed();
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.about),
            onTap: () {
              onDrawerItemTwoPressed();
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.preferencesOption),
            onTap: () {
              onDrawerItemThreePressed();
            },
          ),
        ],
      ),
    );
  }
}
