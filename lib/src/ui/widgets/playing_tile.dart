import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/logic/computer_move.dart';
import 'package:tic_tac_toe/src/logic/game_over.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/providers/player_mark.dart';
import 'package:tic_tac_toe/src/providers/with_computer.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/ui/ui_constants.dart';
import 'package:tic_tac_toe/src/ui/widgets/game_over_dialog.dart';
// import 'package:tic_tac_toe/src/ui/widgets/tile_child.dart';

class PlayingTile extends StatefulWidget {
  final BuildContext context;
  final int index;

  PlayingTile(this.context, this.index);

  @override
  _PlayingTileState createState() => _PlayingTileState();
}

class _PlayingTileState extends State<PlayingTile> with SingleTickerProviderStateMixin {
  int playerMark = 1;
  bool withComputer = true;
  late AnimationController _controller;
  late Animation<double> scaleAnimation;
  bool isResetted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    playerMark = context.watch<PlayerMark>().getMark;
    withComputer = context.watch<WithComputer>().getBool;
    List<int> _intList = context.watch<IntList>().getIntList;
    int _int = context.watch<IntList>().getInt(widget.index);
    // reset the animation when a computer makes a move
    if (withComputer && _int == 2 && !isResetted) {
      sleep(Duration(milliseconds: 125));
      _controller.reset();
      isResetted = true;
    }
    // Runs the animation
    _controller.forward();
    return GestureDetector(
      onTap: !context.watch<IsDisabled>().isDisabled
          ? () {
              gestureDetectorOnTap(_int, _intList);
              _controller.reset();
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 5, color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFDDDDDD) : Colors.black),
            color: Colors.teal.shade400),
        child: Center(
          child: _int == 0
              ? Container()
              : _int == 1
                  ? ScaleTransition(scale: scaleAnimation, child: kCrossIcon_9)
                  : ScaleTransition(scale: scaleAnimation, child: kCircleIcon_9),
        ),
      ),
    );
  }

  void gestureDetectorOnTap(int _int, List<int> _intList) {
    if (_int == 0) {
      if (withComputer) {
        context.read<IntList>().changeValue(widget.index, 1);
        context.read<IsDisabled>().toggleDisabled(true);
        var gameOverPlayer = isGameOver(_intList, 1);
        if (gameOverPlayer == -1) {
          var computerChoice = getMoveswithLogic(_intList);
          // print(computerChoice);
          context.read<IntList>().changeValue(computerChoice, 2);
          var gameOverCom = isGameOver(_intList, 2);
          if (gameOverCom == -1)
            context.read<IsDisabled>().toggleDisabled(false);
          else
            showDialog(context: context, builder: (context) => GameOverDialog(gameOverCom));
        } else {
          showDialog(context: context, builder: (context) => GameOverDialog(gameOverPlayer));
        }
      } else {
        context.read<IntList>().changeValue(widget.index, playerMark);
        var gameOver = isGameOver(_intList, playerMark);
        if (gameOver == -1) {
          context.read<PlayerMark>().changePlayer();
        } else {
          context.read<IsDisabled>().toggleDisabled(true);
          showDialog(context: context, builder: (context) => GameOverDialog(gameOver));
          context.read<IsDisabled>().toggleDisabled(false);
        }
      }
    }
  }
}
