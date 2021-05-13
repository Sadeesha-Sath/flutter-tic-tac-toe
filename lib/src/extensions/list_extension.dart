extension MyListExtension on List {
  Set<int> allIndexWhere(bool Function(dynamic element) test, [int start = 0]) {
    int _i = start;
    Set<int> _returnList = {};
    for (var value in this.sublist(start)) {
      if (test(value)) {
        _returnList.add(_i);
      }
      ++_i;
    }
    return _returnList;
  }
}
