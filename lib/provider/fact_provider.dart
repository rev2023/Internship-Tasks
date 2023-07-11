import 'package:flutter/cupertino.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FactProvider with ChangeNotifier {
  CounterProvider counter = CounterProvider();
  int count = 0;


  FactProvider(){
    notifyListeners();
  }

  String returnFact(int countValue, int i){
    List<String>? facts = factsMap[countValue];
    return facts![i];

  }

  void generateMap(BuildContext context) {
    factsMap.addAll({
      0: [
        AppLocalizations.of(context)!.fact0_0,
        AppLocalizations.of(context)!.fact0_1,
        AppLocalizations.of(context)!.fact0_2
      ],
      1: [
        AppLocalizations.of(context)!.fact1_0,
        AppLocalizations.of(context)!.fact1_1,
        AppLocalizations.of(context)!.fact1_2,
        AppLocalizations.of(context)!.fact1_3
      ],
      2: [
        AppLocalizations.of(context)!.fact2_0,
        AppLocalizations.of(context)!.fact2_1,
        AppLocalizations.of(context)!.fact2_2,
        AppLocalizations.of(context)!.fact2_3
      ],
      3: [
        AppLocalizations.of(context)!.fact3_0,
        AppLocalizations.of(context)!.fact3_1,
        AppLocalizations.of(context)!.fact3_2,
        AppLocalizations.of(context)!.fact3_3
      ],
      4: [
        AppLocalizations.of(context)!.fact4_0,
        AppLocalizations.of(context)!.fact4_1,
        AppLocalizations.of(context)!.fact4_2,
        AppLocalizations.of(context)!.fact4_3
      ],
      5: [
        AppLocalizations.of(context)!.fact5_0,
        AppLocalizations.of(context)!.fact5_1,
        AppLocalizations.of(context)!.fact5_2,
        AppLocalizations.of(context)!.fact5_3
      ],
      6: [
        AppLocalizations.of(context)!.fact6_0,
        AppLocalizations.of(context)!.fact6_1,
        AppLocalizations.of(context)!.fact6_2,
        AppLocalizations.of(context)!.fact6_3
      ],
      7: [
        AppLocalizations.of(context)!.fact7_0,
        AppLocalizations.of(context)!.fact7_1,
        AppLocalizations.of(context)!.fact7_2,
        AppLocalizations.of(context)!.fact7_3
      ],
      8: [
        AppLocalizations.of(context)!.fact8_0,
        AppLocalizations.of(context)!.fact8_1,
        AppLocalizations.of(context)!.fact8_2,
        AppLocalizations.of(context)!.fact8_3
      ],
      9: [
        AppLocalizations.of(context)!.fact9_0,
        AppLocalizations.of(context)!.fact9_1,
        AppLocalizations.of(context)!.fact9_2,
        AppLocalizations.of(context)!.fact9_3
      ],
      10: [
        AppLocalizations.of(context)!.fact10_0,
        AppLocalizations.of(context)!.fact10_1,
        AppLocalizations.of(context)!.fact10_2,
        AppLocalizations.of(context)!.fact10_3
      ],
      11: [
        AppLocalizations.of(context)!.fact11_0,
        AppLocalizations.of(context)!.fact11_1,
        AppLocalizations.of(context)!.fact11_2,
        AppLocalizations.of(context)!.fact11_3
      ],
      12: [
        AppLocalizations.of(context)!.fact12_0,
        AppLocalizations.of(context)!.fact12_1,
        AppLocalizations.of(context)!.fact12_2,
        AppLocalizations.of(context)!.fact12_3
      ],
      13: [
        AppLocalizations.of(context)!.fact13_0,
        AppLocalizations.of(context)!.fact13_1,
        AppLocalizations.of(context)!.fact13_2,
        AppLocalizations.of(context)!.fact13_3
      ],
      14: [
        AppLocalizations.of(context)!.fact14_0,
        AppLocalizations.of(context)!.fact14_1,
        AppLocalizations.of(context)!.fact14_2,
        AppLocalizations.of(context)!.fact14_3
      ],
      15: [
        AppLocalizations.of(context)!.fact15_0,
        AppLocalizations.of(context)!.fact15_1,
        AppLocalizations.of(context)!.fact15_2,
        AppLocalizations.of(context)!.fact15_3
      ],
    });
  }



  final Map<int, List<String>> factsMap = {

  };

}
