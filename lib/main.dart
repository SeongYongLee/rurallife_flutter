import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rurallife_flutter/router/index.dart';
import 'package:rurallife_flutter/state/app.dart';
import 'rurallife_theme.dart';

void main() {
  runApp(const RuralLifeApp());
}

class RuralLifeApp extends StatefulWidget {
  const RuralLifeApp({Key? key}) : super(key: key);

  @override
  _RuralLifeAppState createState() => _RuralLifeAppState();
}

class _RuralLifeAppState extends State<RuralLifeApp> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RuralLifeTheme.light();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: MaterialApp(
        title: 'RuralLife',
        theme: theme,
        home: Router(
          routerDelegate: _appRouter,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
