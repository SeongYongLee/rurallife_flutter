import 'package:flutter/material.dart';
import 'package:rurallife_flutter/components/signup/index.dart';
import 'package:rurallife_flutter/router/index.dart';

class Signup extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.signup,
      key: ValueKey(Routes.signup),
      child: const Signup(),
    );
  }

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _step = 0;

  void _setStepSecond() {
    setState(() {
      _step = 1;
    });
  }

  void _setStepThird() {
    setState(() {
      _step = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 84.0, horizontal: 24.0),
        child: [
          StepFirst(
            next: _setStepSecond,
          ),
          StepSecond(
            next: _setStepThird,
          ),
          Text('third')
        ][_step],
      ),
    );
  }
}
