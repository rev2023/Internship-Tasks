import 'package:auto_route/auto_route.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/widgets/counter_button.dart';
import 'package:counter_app/styles/app_colors.dart';
import 'package:counter_app/router/app_router.gr.dart';
import 'package:counter_app/widgets/reset_button.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Text('Counter App'),
          ),
        ),
      ),
      drawer: CustomDrawer(
        onDrawerItemOnePressed: () {
          context.router.push(const AppearanceRoute());
        },
        onDrawerItemTwoPressed: () {
          context.router.push(const AboutRoute());
        },
      ),
      body: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterProvider>(context);
    final count = viewModel.count;

    // Instances of the counter button
    CounterButton increaseButton = CounterButton(
      onPressed: () {
        viewModel.increment();
      },
      enableFeedback: !viewModel.maxLimitReached,
      //color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: 'Increase ++',
      textColor: AppColors.buttonText,
    );
    ResetButton resetButton = ResetButton(
      onPressed: () {
        viewModel.reset();
      },
      enableFeedback: !viewModel.maxLimitReached,
      text: 'Reset',
    );
    CounterButton decreaseButton = CounterButton(
      onPressed: () {
        if (viewModel.isZero == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error: Cannot decrement below 0'),
            ),
          );
        }
        viewModel.decrement();
      },
      enableFeedback: true,
      //color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: 'Decrease --',
      textColor: AppColors.buttonText,
    );

    return Scaffold(
      body: Center(
        child: Column(
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
                  child: Image.asset('lib/utils/info_button.png')),
            ),
            Text(
              'Number of times button clicked: $count',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.onSurface),
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
              visible: !viewModel
                  .isZero, // Only show the button if count is not equal to 0
              child: resetButton,
            ),
          ],
        ),
      ),
    );
  }
}
