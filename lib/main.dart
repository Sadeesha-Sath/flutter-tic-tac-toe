import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/providers/player_mark.dart';
import 'package:tic_tac_toe/src/providers/theme_changer.dart';
import 'package:tic_tac_toe/src/providers/with_computer.dart';
import 'package:tic_tac_toe/src/ui/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger()),
        ChangeNotifierProvider<PlayerMark>(create: (_) => PlayerMark()),
        Provider<WithComputer>(
          create: (_) => WithComputer(),
        ),
        ChangeNotifierProvider<IsDisabled>(create: (_) => IsDisabled()),
        ChangeNotifierProvider<IntList>(create: (_) => IntList()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = context.watch<ThemeChanger>().getTheme;
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
