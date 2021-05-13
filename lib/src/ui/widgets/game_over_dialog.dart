import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/providers/with_computer.dart';
import 'package:provider/provider.dart';

class GameOverDialog extends StatefulWidget {
  final int gameOver;

  GameOverDialog(this.gameOver);
  @override
  State<StatefulWidget> createState() => GameOverDialogState();
}

class GameOverDialogState extends State<GameOverDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    bool withComputer = context.watch<WithComputer>().getBool;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 12),
              decoration: ShapeDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Theme.of(context).scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
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
                        widget.gameOver == 0
                            ? "It's a Draw. Care for a rematch?"
                            : widget.gameOver == 1
                                ? withComputer
                                    ? "You Won! You must be practising. Keep up the good work!"
                                    : "Player 1 Won. Congratulations!"
                                : withComputer
                                    ? "Aw! The Computer Won. Don't worry, Practice Makes Perfect!"
                                    : 'Player 2 Won. Congratulations!',
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
          ),
        ),
      ),
    );
  }
}
