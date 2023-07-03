import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



@RoutePage()
class FactScreen extends StatelessWidget {
  const FactScreen({super.key, required this.count});

  final int count;

  @override

  Widget build(BuildContext context) {
    final aboutProvider = Provider.of<FactProvider>(context);

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
      body: ListView(
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
