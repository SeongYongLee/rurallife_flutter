import 'dart:async';

import 'package:flutter/material.dart';

// 1
class MainTab {
  static const int discovery = 0;
  static const int search = 1;
  static const int reserve = 2;
  static const int my = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _isDetailPage = false;
  bool _isReservePage = false;
  int _selectedTab = MainTab.discovery;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isDetailPage => _isDetailPage;
  bool get isReservePage => _isReservePage;
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

  void backToHome() {
    _isDetailPage = false;
    notifyListeners();
  }

  void goToDetail() {
    _isDetailPage = true;
    notifyListeners();
  }

  void backToDetail() {
    _isReservePage = false;
    notifyListeners();
  }

  void goToReserve() {
    _isReservePage = true;
    notifyListeners();
  }
}
