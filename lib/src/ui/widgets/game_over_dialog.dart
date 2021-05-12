import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  final int gameOver;

  GameOverDialog(this.gameOver);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // TODO add animations to the dialog
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 12),
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 15),
              child: Center(
                child: Text(
                  "Game Over",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  gameOver == 0
                      ? "It's a Draw. Care for a rematch?"
                      : gameOver == 1
                          ? "You Won! You must be practising. Keep up the good work!"
                          : "Aw! The Computer Won. Don't worry, Practice Makes Perfect!",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(
                    flex: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 16.5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
