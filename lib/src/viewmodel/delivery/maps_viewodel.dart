import 'package:flutter/material.dart';

class MapsViewModel extends ChangeNotifier {
  MapsViewModel() {
    getDeliveryLocation();
  }

  // Setters
  bool _isLoading = true;

  // Getters
  bool get isLoading => _isLoading;

  // Methods
  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getDeliveryLocation() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => setIsLoading = false);
  }
}
