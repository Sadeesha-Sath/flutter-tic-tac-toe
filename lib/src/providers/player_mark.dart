import 'package:flutter/cupertino.dart';

class PlayerMark with ChangeNotifier {
  int _playerMark = 1;

  void changePlayer([int? mark]) {
    if (mark != null)
      _playerMark = mark;
    else {
      if (_playerMark == 1) {
        _playerMark = 2;
      } else {
        _playerMark = 1;
      }
    }
    notifyListeners();
  }

  int get getMark => _playerMark;
}
