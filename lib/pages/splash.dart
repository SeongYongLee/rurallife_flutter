import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/router/index.dart';
import 'package:rurallife_flutter/state/app.dart';

class Splash extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.splash,
      key: ValueKey(Routes.splash),
      child: const Splash(),
    );
  }

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('SplashPage')],
        ),
      ),
    );
  }
}
