import 'package:flutter/material.dart';

class IsDisabled extends ChangeNotifier {
  bool _isDisabled = false;

  void toggleDisabled(bool value) {
    _isDisabled = value;
    notifyListeners();
  }

  bool get isDisabled => _isDisabled;
}
