import 'package:flutter/material.dart';


const colorList = <Color>[
  Colors.red,
  Colors.blue,
  Colors. greenAccent,
  Colors.pink,
  Colors.orange,
  Colors.tealAccent
];


class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }): assert(selectedColor >= 0, 'Selected color must be gratter than 0'),
        assert(selectedColor < colorList.length, 'Selected color must be lower than ${colorList.length}');


    ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      )
    );



}