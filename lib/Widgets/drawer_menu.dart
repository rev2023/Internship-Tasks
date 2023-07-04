import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemOnePressed;
  final VoidCallback onDrawerItemTwoPressed;

  const CustomDrawer({
    Key? key,
    required this.onDrawerItemOnePressed,
    required this.onDrawerItemTwoPressed,
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
                children: const [
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 18.5),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.settings),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Appearance'),
            onTap: () {
              onDrawerItemOnePressed();
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              onDrawerItemTwoPressed();
            },
          ),
        ],
      ),
    );
  }
}
