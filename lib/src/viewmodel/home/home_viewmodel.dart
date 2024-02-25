import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();

  // Setters
  int _selectedIndex = 1;

  // Getters
  int get selectedIndex => _selectedIndex;

  // Methods
  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
