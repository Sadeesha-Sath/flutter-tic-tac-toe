import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/providers/theme_changer.dart';
import 'package:tic_tac_toe/src/providers/with_computer.dart';
import 'package:tic_tac_toe/src/ui/screens/game_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light ? Icons.nights_stay_rounded : Icons.wb_sunny),
            onPressed: () {
              context.read<ThemeChanger>().changeTheme();
            },
            splashRadius: 22,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 250,
              height: 400,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal.shade400,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(Theme.of(context).brightness == Brightness.light
                        ? "assets/icon_light.png"
                        : "assets/icon_dark.png"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.read<IsDisabled>().toggleDisabled(false);
                  context.read<IntList>().initializeList(9);
                  context.read<WithComputer>().changeValue(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(
                    Icons.computer,
                    color: Colors.grey.shade100,
                  ),
                  title: Text(
                    "Vs Computer",
                    style: TextStyle(color: Colors.grey.shade100),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                onPressed: () {
                  context.read<IsDisabled>().toggleDisabled(false);
                  context.read<IntList>().initializeList(9);
                  context.read<WithComputer>().changeValue(false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.people_rounded,
                    color: Colors.grey.shade100,
                  ),
                  title: Text(
                    "Player vs Player",
                    style: TextStyle(color: Colors.grey.shade100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
