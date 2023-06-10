import 'package:flutter/material.dart';

class HiveProvider extends ChangeNotifier {
  int _counter = 0;

  getCounter(context) => _counter;
  setCounter(int counter) => _counter = counter;

  void hiveCounter(int value) {
    _counter = value;
    notifyListeners();
  }
}
