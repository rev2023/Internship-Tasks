import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:counter_app/provider/tab_provider.dart';

class BottomBar extends StatelessWidget {
  int indexPressed = 0;
  @override
  Widget build(BuildContext context) {
    TabProvider tabProvider = Provider.of<TabProvider>(context, listen: true);
    indexPressed = tabProvider.currentTab;
    return BottomNavigationBar(
      currentIndex: indexPressed,
      onTap: tabProvider.onTap,
      elevation: 50,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_sharp),
            label: AppLocalizations.of(context)!.cards,

        ),
      ],
    );
  }
}

