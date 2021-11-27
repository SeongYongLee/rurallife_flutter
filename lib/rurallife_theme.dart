import 'package:flutter/material.dart';

class RuralLifeTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
    subtitle2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    button: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline5: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: 'SpoqaHanSansNeo',
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      colorScheme: ColorScheme(
        primary: Colors.red,
        onPrimary: Colors.white,
        primaryVariant: Colors.orange,
        background: Colors.red,
        onBackground: Colors.black,
        secondary: Colors.red,
        onSecondary: Color(0xFFf76e22),
        secondaryVariant: Colors.deepOrange,
        error: Colors.black,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'SpoqaHanSansNeo',
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
    );
  }
}
