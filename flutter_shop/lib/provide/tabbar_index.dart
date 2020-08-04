import 'package:flutter/material.dart';

class TabBarIndexProvide with ChangeNotifier {
  int currentIndex = 0;
  changeTabBarIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
