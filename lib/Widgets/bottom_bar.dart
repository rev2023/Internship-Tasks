import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tab_provider.dart';

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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_sharp),
          label: 'Cards',
        ),
      ],
    );
  }
}

