import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/components/signup/index.dart';
import 'package:rurallife_flutter/router/index.dart';
import 'package:rurallife_flutter/state/app.dart';

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

  void _goSecondStep() {
    setState(() {
      _step = 1;
    });
  }

  void _goThirdStep() {
    setState(() {
      _step = 2;
    });
  }

  void _onLogin() async {
    Provider.of<AppStateManager>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 84.0, horizontal: 24.0),
        child: [
          StepFirst(
            next: _goSecondStep,
          ),
          StepSecond(
            next: _goThirdStep,
          ),
          StepThird(
            next: _onLogin,
          ),
        ][_step],
      ),
    );
  }
}
