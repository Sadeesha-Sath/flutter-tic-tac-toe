import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/providers/with_computer.dart';
import 'package:tic_tac_toe/src/ui/widgets/playing_tile.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var withComputer = context.watch<WithComputer>().getBool;
    return Scaffold(
      appBar: AppBar(
        title: withComputer
            ? Text("Tic Tac Toe")
            : Text(
                "PvP",
                style: TextStyle(letterSpacing: 1.2),
              ),
        centerTitle: true,
      ),
      body: GameScreenContent(),
    );
  }
}

class GameScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 5, color: Theme.of(context).brightness == Brightness.dark ? Color(0xFFDDDDDD) : Colors.black),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              // crossAxisCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) => PlayingTile(context, index),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
            onPressed: () {
              context.read<IsDisabled>().toggleDisabled(false);
              context.read<IntList>().resetList();
            },
            child: Text(
              "Reset",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
