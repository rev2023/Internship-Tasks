import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/widgets/counter_button.dart';
import 'package:counter_app/styles/app_colors.dart';
import 'package:counter_app/router/app_router.gr.dart';
import 'package:counter_app/widgets/reset_button.dart';
import 'package:counter_app/widgets/app_bar.dart';
import 'package:counter_app/provider/tab_provider.dart';
import 'package:counter_app/widgets/bottom_bar.dart';
import 'package:counter_app/screens/carousel_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screenOptions = [const CounterScreen(), const CarouselScreen()];
    TabProvider tabProvider = Provider.of<TabProvider>(context, listen: true);

    return Scaffold(
      appBar: CustomAppBar(text: AppLocalizations.of(context)!.appbar),
      drawer: CustomDrawer(
        onDrawerItemOnePressed: () {
          context.router.push(const AppearanceRoute());
        },
        onDrawerItemTwoPressed: () {
          context.router.push(const AboutRoute());
        },
        onDrawerItemThreePressed: () {
          context.router.push(const PreferencesRoute());
        },
      ),
      body: screenOptions[tabProvider.currentTab],
      bottomNavigationBar: BottomBar(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterProvider>(context, listen: false);
    const String assetName = 'lib/assets/info_button.svg';
    final Widget informationImage = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Information Button',
    );

    // Instances of the counter button
    CounterButton increaseButton = CounterButton(
      onPressed: () {
        viewModel.increment();
      },
      enableFeedback: !viewModel.maxLimitReached,
      //color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: AppLocalizations.of(context)!.increase,
      textColor: AppColors.buttonText,
    );
    ResetButton resetButton = ResetButton(
      onPressed: () {
        viewModel.reset();
      },
      enableFeedback: !viewModel.maxLimitReached,
      text: AppLocalizations.of(context)!.reset,
    );
    CounterButton decreaseButton = CounterButton(
      onPressed: () {
        if (viewModel.isZero == true) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text(AppLocalizations.of(context)!.error),
            ),
          );
        }
        viewModel.decrement();
      },
      enableFeedback: true,
      //color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: AppLocalizations.of(context)!.decrease,
      textColor: AppColors.buttonText,
    );

    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counter, child) {
            int count = counter.count;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(300, 0, 0, 0),
                  width: 40,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(FactRoute(count: count));
                    },
                    child: informationImage,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.count(count),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 40),
                Opacity(
                  opacity: viewModel.maxLimitReached ? 0.3 : 1,
                  child: increaseButton,
                ),
                const SizedBox(
                  height: 20,
                ),
                decreaseButton,
                const SizedBox(height: 20),
                Visibility(
                  visible: !viewModel.isZero,
                  // Only show the button if count is not equal to 0
                  child: resetButton,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
