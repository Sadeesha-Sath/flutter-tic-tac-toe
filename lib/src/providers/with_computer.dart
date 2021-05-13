class WithComputer {
  bool _withComputer = true;

  void changeValue(bool newValue) {
    _withComputer = newValue;
  }

  bool get getBool => _withComputer;
}
