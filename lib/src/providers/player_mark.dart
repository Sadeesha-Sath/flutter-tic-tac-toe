import 'package:flutter/cupertino.dart';

class PlayerMark with ChangeNotifier {
  int _playerMark = 1;

  void changePlayer() {
    if (_playerMark == 1) {
      _playerMark = 2;
    } else {
      _playerMark = 1;
    }
    notifyListeners();
  }

  int get getMark => _playerMark;
}
