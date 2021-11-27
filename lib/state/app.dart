import 'dart:async';

import 'package:flutter/material.dart';

// 1
class MainTab {
  static const int discovery = 0;
  static const int search = 1;
  static const int reservation = 2;
  static const int my = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _isDetailPage = false;
  int _selectedTab = MainTab.discovery;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isDetailPage => _isDetailPage;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToDetail() {
    _isDetailPage = true;
    notifyListeners();
  }

  void backToHome() {
    _isDetailPage = false;
    notifyListeners();
  }
}
