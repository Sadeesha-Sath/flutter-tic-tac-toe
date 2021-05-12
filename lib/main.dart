import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/src/providers/int_list.dart';
import 'package:tic_tac_toe/src/providers/is_disabled.dart';
import 'package:tic_tac_toe/src/ui/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<IsDisabled>(create: (_) => IsDisabled()),
      ChangeNotifierProvider<IntList>(create: (_) => IntList()),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
