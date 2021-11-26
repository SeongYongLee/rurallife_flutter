import 'package:flutter/material.dart';

class RuralLifeTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
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
      inputDecorationTheme: const InputDecorationTheme(),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'SpoqaHanSansNeo',
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
