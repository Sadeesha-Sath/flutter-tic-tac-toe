import 'package:tic_tac_toe/src/extensions/list_extension.dart';

// 0 for draw, 1 for user, 2 for com, -1 for not over
int isGameOverPlayer(List<int> intList) {
  var _playerValues = intList.allIndexWhere((element) => element == 1).toSet();
  for (Set<int> winningSet in _winningSets) {
    if (_playerValues.containsAll(winningSet)) {
      return 1;
    }
  }
  var _availableValues = intList.allIndexWhere((element) => element == 0);
  if (_availableValues.isEmpty) {
    return 0;
  }
  return -1;
}

int isGameOverComputer(List<int> intList) {
  var _computerValues = intList.allIndexWhere((element) => element == 2).toSet();
  for (Set<int> winningSet in _winningSets) {
    if (_computerValues.containsAll(winningSet)) {
      return 2;
    }
  }
  return -1;
}

Set<Set<int>> _winningSets = {
  {0, 4, 8},
  {0, 1, 2},
  {0, 3, 6},
  {1, 4, 7},
  {2, 5, 8},
  {3, 4, 5},
  {6, 7, 8},
  {2, 4, 6}
};
