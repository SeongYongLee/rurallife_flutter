import 'package:flutter/material.dart';
import 'package:rurallife_flutter/api/mock.dart';
import 'package:rurallife_flutter/router/index.dart';

class Reserve extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.reserve,
      key: ValueKey(Routes.reserve),
      child: Reserve(),
    );
  }

  Reserve({Key? key}) : super(key: key);

  final mock = Mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 84.0, horizontal: 24.0),
        child: Text('Reserve'),
      ),
    );
  }
}
