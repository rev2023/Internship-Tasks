import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  //Constructor
   const CustomAppBar({super.key,
     required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:  Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
        child: Text(text),
      ),
      ),
    );


  }


}
