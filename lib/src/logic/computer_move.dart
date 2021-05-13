import 'dart:math' as math;
import 'package:tic_tac_toe/src/extensions/list_extension.dart';

// ? Easy mode with random values for the computer
// int getMovesEasy(List<int> intList) {
//   var validValues = intList.allIndexWhere((element) => element == 0);
//   var _random = math.Random();
//   return validValues.elementAt(_random.nextInt(validValues.length));
// }

int getMoveswithLogic(List<int> intList) {
  var validValues = intList.allIndexWhere((element) => element == 0);
  if (validValues.contains(4)) return 4;
  var opponentValues = intList.allIndexWhere((element) => element == 1);
  var myValues = intList.allIndexWhere((element) => element == 2);
  var _random = math.Random();

  // As there is a rule to get the middle square if its available, there is no need to check for other one valued results
  if (opponentValues.length == 1 && opponentValues.contains(4)) {
    return [0, 2, 6, 8].elementAt(_random.nextInt(4));
  }

  // check for winning chances
  if (myValues.length >= 2) {
    var goodWinningValues = winningValues(myValues);
    for (int goodVal in goodWinningValues) {
      if (validValues.contains(goodVal)) {
        return goodVal;
      }
    }
  }

  // Logic for preventing a defeat
  if (opponentValues.length == 2) {
    if (opponentValues.contains(4) &&
        (opponentValues.contains(0) ||
            opponentValues.contains(2) ||
            opponentValues.contains(6) ||
            opponentValues.contains(8))) {
      var goodVals = [0, 2, 4, 8];
      for (int goodVal in goodVals) {
        if (validValues.contains(goodVal)) {
          return goodVal;
        }
      }
    }
  }

  var goodChoices = winningValues(opponentValues);
  for (int goodChoice in goodChoices) {
    if (validValues.contains(goodChoice)) return goodChoice;
  }

  return validValues.elementAt(_random.nextInt(validValues.length));
}

Set<int> winningValues(Set<int> valueSet) {
  Set<int> returnSet = {};
  if (valueSet.containsAll({0, 1})) returnSet.add(2);
  if (valueSet.containsAll({0, 3})) returnSet.add(6);
  if (valueSet.containsAll({1, 2})) returnSet.add(0);
  if (valueSet.containsAll({2, 5})) returnSet.add(8);
  if (valueSet.containsAll({3, 6})) returnSet.add(0);
  if (valueSet.containsAll({5, 8})) returnSet.add(2);
  if (valueSet.containsAll({6, 7})) returnSet.add(8);
  if (valueSet.containsAll({7, 8})) returnSet.add(6);
  if (valueSet.containsAll({0, 2})) returnSet.add(1);
  if (valueSet.containsAll({0, 6})) returnSet.add(3);
  if (valueSet.containsAll({2, 8})) returnSet.add(5);
  if (valueSet.containsAll({6, 8})) returnSet.add(7);
  if (valueSet.containsAll({0, 4})) returnSet.add(8);
  if (valueSet.containsAll({2, 4})) returnSet.add(6);
  if (valueSet.containsAll({6, 4})) returnSet.add(2);
  if (valueSet.containsAll({8, 4})) returnSet.add(0);
  if (valueSet.containsAll({1, 4})) returnSet.add(7);
  if (valueSet.containsAll({3, 4})) returnSet.add(5);
  if (valueSet.containsAll({7, 4})) returnSet.add(1);
  if (valueSet.containsAll({5, 4})) returnSet.add(3);
  return returnSet;
}
