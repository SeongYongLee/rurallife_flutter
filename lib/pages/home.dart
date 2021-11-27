import 'package:flutter/material.dart';
import 'package:rurallife_flutter/router/index.dart';

class Home extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.home,
      key: ValueKey(Routes.home),
      child: const Home(),
    );
  }

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('HomePage')],
        ),
      ),
    );
  }
}
