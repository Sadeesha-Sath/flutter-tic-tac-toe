import 'dart:math' as math;
import 'package:tic_tac_toe/src/extensions/list_extension.dart';

int getComputerMove(List<int> intList) {
  var validValues = intList.allIndexWhere((element) => element == 0);
  print(validValues);
  var _random = math.Random();
  return validValues.elementAt(_random.nextInt(validValues.length));
}
// TODO Add more sophisticated logic for the computer