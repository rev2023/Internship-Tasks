import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterViewModel extends ChangeNotifier{

  int _count = 0;
  final int _maxLimit = 15;
  int get count => _count;
  bool get isZero => (_count == 0);
  bool get maxLimitReached => _count == _maxLimit;


  //Constructor
  CounterViewModel() {
    _loadCount();
  }

  // Method for loading the current count from the shared preferences instance
  // Called in the constructor
  void _loadCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt('count') ?? 0;
    notifyListeners();
  }

  //Method for reading current count into shared preferences
  void _saveCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', _count);
  }

  // adjusting the count variables
  // count can't go below 0
  void increment() {
    if(count < 15) {
      _count = _count + 1;
      notifyListeners();
      _saveCount();
    }
  }

  void decrement() {
    if(count > 0){
      _count = _count - 1;
      notifyListeners();
      _saveCount();
    }

  }
  void reset() {
    _count = 0;
    notifyListeners();
  }
}

