import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar.dart';

@RoutePage()
class FactScreen extends StatelessWidget {
  const FactScreen({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    final aboutProvider = Provider.of<FactProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(text: 'Counter App'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text(aboutProvider.returnFact(count, 0)),
          ),
          ListTile(
            title: Text(aboutProvider.returnFact(count, 1)),
          ),
          ListTile(
            title: Text(aboutProvider.returnFact(count, 2)),
          ),
          ListTile(
            title: Text(aboutProvider.returnFact(count, 3)),
          ),
        ],
      ),
    );
  }
}
