import 'package:flutter/material.dart';
import 'package:solution_challenge/src/model/chart/chart_model.dart';
import 'package:solution_challenge/src/model/chart/donate_model.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel();

  // Setters
  List<ChartModel> data = [
    ChartModel(title: 'Total', number: 77),
    ChartModel(title: 'You', number: 23),
  ];

  List<DonateModel> donate = [
    DonateModel(title: 'Total', number: 1000),
    DonateModel(title: 'You', number: 3885),
  ];

  // Getters

  // Methods
}
