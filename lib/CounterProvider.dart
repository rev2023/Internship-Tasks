import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier{


  int _count = 0;
  int get count => _count;

  // adjusting the count variables
  // count can't go below 0
  void increment(){
    if(count>=0){
      _count = _count+1;
      notifyListeners();
    }

  }

  void decrement(){
    if(count>0){
      _count = _count-1;
      notifyListeners();
    }
  }
  void reset(){
    _count = 0;
    notifyListeners();
  }

}

