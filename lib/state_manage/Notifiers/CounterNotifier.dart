import 'package:flutter/foundation.dart';

class CounterNotifer extends ChangeNotifier{
  int _counter = 0;

  setCount(val){
    _counter = val;
    notifyListeners();
  }

  get getCount => _counter;

}