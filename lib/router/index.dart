import 'package:flutter/material.dart';
import 'package:rurallife_flutter/pages/index.dart';
import 'package:rurallife_flutter/state/app.dart';

class Routes {
  static String splash = '/splash';
  static String signup = '/signup';
  static String home = '/home';
}

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) Splash.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          Signup.page(),
        if (appStateManager.isLoggedIn) Home.page()
        // Home.page()
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
