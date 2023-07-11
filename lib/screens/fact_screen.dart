import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class FactScreen extends StatelessWidget {
  const FactScreen({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: AppLocalizations.of(context)!.appbar),
      body: Consumer<FactProvider>(
        builder: (context, factProvider, child) {
          factProvider.generateMap(context);
          return ListView(
            children: [
              const SizedBox(height: 20),
              ListTile(
                title: Text(factProvider.returnFact(count, 0)),
              ),
              ListTile(
                title: Text(factProvider.returnFact(count, 1)),
              ),
              ListTile(
                title: Text(factProvider.returnFact(count, 2)),
              ),
              ListTile(
                title: Text(factProvider.returnFact(count, 3)),
              ),
            ],
          );
        },
      ),
    );
  }
}
