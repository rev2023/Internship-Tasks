import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterViewModel extends ChangeNotifier{

  int _count = 0;
  int get count => _count;
  bool isZero = true;
  bool maxLimitReached = false;
  double opacityOfButton = 1;

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

  // Checks current value of count variable and sets the
  // other variables accordingly
  void checkValue(){
    if(_count == 0){
      isZero = true;
      opacityOfButton = 1;
    }
    else if(_count == 15){
      maxLimitReached = true;
      isZero = false;
      opacityOfButton = 0.3;
    }
    else{
      isZero = false;
      maxLimitReached = false;
      opacityOfButton = 1;
    }

  }

  // adjusting the count variables
  // count can't go below 0
  void increment() {
    if(count < 15) {
      _count = _count + 1;
      checkValue();
      notifyListeners();
      _saveCount();
    }
  }

  void decrement() {
    if(count > 0){
      _count = _count - 1;
      checkValue();
      notifyListeners();
      _saveCount();
    }

  }

  void reset(){
    _count = 0;
    notifyListeners();
    checkValue();
  }

}

