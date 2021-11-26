import 'package:flutter/material.dart';
import 'package:rurallife_flutter/pages/signup.dart';
import 'rurallife_theme.dart';

void main() {
  runApp(const RuralLifeApp());
}

class RuralLifeApp extends StatelessWidget {
  const RuralLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RuralLifeTheme.light();
    return MaterialApp(
      title: 'RuralLife',
      theme: theme,
      home: const Signup(),
    );
  }
}
