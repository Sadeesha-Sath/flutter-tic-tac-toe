import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/ui/widgets/playing_tile.dart';
import 'package:provider/provider.dart';

// TODO Make a 2 Player mode

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<BoolList>().initializeList(9);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.nights_stay_rounded),
            onPressed: () {},
            splashRadius: 22,
          ),
        ],
      ),
      body: ScreenContent(),
    );
  }
}
// TODO add a customize page and solve the issue of initializing the intList

class ScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 0),
      () => context.read<IntList>().initializeList(9),
    );
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5),
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
