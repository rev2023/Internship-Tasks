import 'package:counter_app/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/Widgets/counter_button.dart';

import 'Utils/app_colors.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Center(
            child: Text('Counter App'),
          ),
        ),
        body: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);
    final count = viewModel.count;


    //Instances of the counter button
    CounterButton increaseButton = CounterButton(
      onPressed: () {
        viewModel.increment();
        },
      enableFeedback: !viewModel.maxLimitReached,
      color: AppColors.enabledButton,
      text: 'Increase ++',
    );
    CounterButton resetButton = CounterButton(
      onPressed: () {
        viewModel.reset();
      },
      enableFeedback: !viewModel.maxLimitReached,
      color: AppColors.resetButton,
      text: 'Reset ++',
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
      color: AppColors.enabledButton,
      text: 'Decrease --',
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of times button clicked: $count',
              style: const TextStyle(fontSize: 20, color: AppColors.textColor),
            ),
            const SizedBox(height: 40),
            Opacity(
              opacity: viewModel.maxLimitReached ? 0.3: 1,
              child: increaseButton,
            ),
            const SizedBox(
              height: 20,
            ),
            decreaseButton,
            const SizedBox(height: 20),
            Visibility(
              visible: !viewModel.isZero, //Only show the button if count is not equal to 0
              child: resetButton,
            ),
          ],
        ),
      ),
    );
  }
}
