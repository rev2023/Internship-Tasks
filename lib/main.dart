import 'package:counter_app/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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

//Building the UI of the main screen
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);
    final count = viewModel.count;
    const double buttonHeight = 50;
    const double  buttonWidth = 200;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Number of times button clicked: ${viewModel.count}',
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 40),
          MaterialButton( // Button for Incrementing
            onPressed: () {
              viewModel.increment();
            },
            height: buttonHeight,
            minWidth: buttonWidth,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.blue,
            child: const Text(
              'Increase ++',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton( //Button for decrementing
            onPressed: () {
              viewModel.decrement();
            },
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minWidth: 200,
            color: Colors.blue,
            child: const Text(
              'Decrease --',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton( // Button for resetting
            onPressed: () {
              viewModel.reset();
            },
            height: 50,
            minWidth: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.blueGrey[600],
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
