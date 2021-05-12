import 'package:flutter/material.dart';

class IntList extends ChangeNotifier {
  List<int> _intList = [];

  void initializeList(int length) {
    _intList = Iterable.generate(length, (int index) => 0).toList();
    notifyListeners();
  }

  void changeValue(int index, int value) {
    assert(value == 1 || value == 2);
    _intList[index] = value;
    notifyListeners();
  }

  void resetList() {
    _intList = _intList.map((e) => 0).toList();
    notifyListeners();
  }

  List<int> get getIntList => _intList;
  int getInt(int index) => _intList[index];
}
