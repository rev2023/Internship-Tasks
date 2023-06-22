import 'package:counter_app/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/Widgets/counter_button.dart';

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
          backgroundColor: Colors.blueGrey[800],
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
    const double buttonHeight = 50;
    const double buttonWidth = 200;

    //Instances of the counter button
    CounterButton increaseButton = CounterButton(
      onPressed: () {
        viewModel.increment();
      },
      enableFeedback: !viewModel.maxLimitReached,
      color: Colors.blue,
      text: 'Increase ++',
    );
    CounterButton resetButton = CounterButton(
      onPressed: () {
        viewModel.reset();
      },
      enableFeedback: !viewModel.maxLimitReached,
      color: Colors.blueGrey,
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
      color: Colors.blue,
      text: 'Decrease --',
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of times button clicked: $count',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 40),
            Opacity(
              opacity: viewModel.opacityOfButton,
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
