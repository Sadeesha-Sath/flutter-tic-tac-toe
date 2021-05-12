import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/logic/computer_move.dart';
import 'package:tic_tac_toe/src/logic/game_over.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/ui/widgets/game_over_dialog.dart';

class PlayingTile extends StatefulWidget {
  final BuildContext context;
  final int index;

  PlayingTile(this.context, this.index);

  @override
  _PlayingTileState createState() => _PlayingTileState();
}

class _PlayingTileState extends State<PlayingTile> {
  @override
  Widget build(BuildContext context) {
    List<int> _intList = context.watch<IntList>().getIntList;
    int _int = context.watch<IntList>().getInt(widget.index);
    return GestureDetector(
      onTap: !context.watch<IsDisabled>().isDisabled
          ? () async {
              if (_int == 0) {
                context.read<IntList>().changeValue(widget.index, 1);
                context.read<IsDisabled>().toggleDisabled(true);
                var gameOverPlayer = isGameOverPlayer(_intList);
                if (gameOverPlayer == -1) {
                  var computerChoice = getComputerMove(_intList);
                  print(computerChoice);
                  context.read<IntList>().changeValue(computerChoice, 2);
                  var gameOverCom = isGameOverComputer(_intList);
                  if (gameOverCom == -1)
                    context.read<IsDisabled>().toggleDisabled(false);
                  else
                    showDialog(context: context, builder: (context) => GameOverDialog(gameOverCom));
                } else {
                  showDialog(context: context, builder: (context) => GameOverDialog(gameOverPlayer));
                }
              }
            }
          : null,
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 5), color: Colors.teal.shade400),
        child: Center(
          child: _int == 0
              ? Container()
              : _int == 1
                  ? kCrossIcon_9
                  : kCircleIcon_9,
        ),
      ),
    );
  }
}
