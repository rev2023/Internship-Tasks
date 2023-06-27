import 'package:auto_route/auto_route.dart';
import 'package:counter_app/counter_view_model.dart';
import 'package:counter_app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/widgets/counter_button.dart';
import 'package:counter_app/utils/app_colors.dart';

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
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                child:  DrawerHeader(
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
                      Text('Settings', style: TextStyle(fontSize: 18.5),),
                      SizedBox(width: 10,),
                      Icon(Icons.settings),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Appearance'),
                onTap: () {
                  // Update the state of the app
                  context.router.push(const AppearanceRoute());
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const CounterScreen(),
      );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);
    final count = viewModel.count;

    // Instances of the counter button
    CounterButton increaseButton = CounterButton(
      onPressed: () {
        viewModel.increment();
      },
      enableFeedback: !viewModel.maxLimitReached,
      color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: 'Increase ++',
      textColor: AppColors.buttonText,
    );
    CounterButton resetButton = CounterButton(
      onPressed: () {
        viewModel.reset();
      },
      enableFeedback: !viewModel.maxLimitReached,
      color: Theme.of(context).buttonTheme.colorScheme!.onSurface,
      textColor: Theme.of(context).colorScheme.primary,
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
      color: Theme.of(context).buttonTheme.colorScheme!.primary,
      text: 'Decrease --',
      textColor: AppColors.buttonText,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of times button clicked: $count',
              style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),
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
              visible: !viewModel.isZero, // Only show the button if count is not equal to 0
              child: resetButton,
            ),
          ],
        ),
      ),
    );
  }
}
