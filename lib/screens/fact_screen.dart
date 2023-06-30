import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_config.dart';
import '../provider/counter_provider.dart';
import '../utils/service_locator.dart';


@RoutePage()
class FactScreen extends StatelessWidget {
  const FactScreen({super.key});

  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final aboutProvider = Provider.of<FactProvider>(context);
    final viewModel = Provider.of<CounterProvider>(context);
    final count = viewModel.count;



    return  Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Text('Counter App'),
          ),
        ),
      ),
      body: Column(
        children:  [
          const SizedBox(
            height: 20,
          ),
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
