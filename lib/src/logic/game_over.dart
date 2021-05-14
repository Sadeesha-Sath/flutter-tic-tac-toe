import 'package:tic_tac_toe/src/extensions/list_extension.dart';

// 0 for draw, 1 for user, 2 for com, -1 for not over
int isGameOver(List<int> intList, int playerMark) {

  var _playerMarkValues = intList.allIndexWhere((element) => element == playerMark);
  for (Set<int> winningSet in _winningSets) {
    if (_playerMarkValues.containsAll(winningSet)) {
      return playerMark;
    }
  }

  var _availableValues = intList.allIndexWhere((element) => element == 0);
  if (_availableValues.isEmpty) {
    return 0;
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
