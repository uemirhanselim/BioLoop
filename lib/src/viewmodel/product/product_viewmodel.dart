import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel();

  // Setters
  final List<Map<String, dynamic>> _products = [
    {
      "type": "Bread",
      "name": "Royal Hotel",
      "location": "Antalya/Alanya",
      "amount": 3,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 18:20",
    },
    {
      "type": "Manure",
      "name": "Ahmet Sarı",
      "location": "Antalya/Alanya",
      "amount": 5,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 09:30",
    },
    {
      "type": "Fruits",
      "name": "Orhun Kaçmaz",
      "location": "Antalya/Alanya",
      "amount": 10,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 12:00",
    },
    {
      "type": "Foods",
      "name": "Lara Hotel",
      "location": "Antalya/Alanya",
      "amount": 3,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 15:00",
    },
    {
      "type": "Desserts",
      "name": "Wings Hotel",
      "location": "Antalya/Alanya",
      "amount": 5,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 18:00",
    },
    {
      "type": "Manure",
      "name": "Ceyhun Tuna",
      "location": "Antalya/Alanya",
      "amount": 10,
      "phone": "0532 123 45 67",
      "date": "2024-05-01 - 20:00",
    },
  ];

  // Getters
  List<Map<String, dynamic>> get products => _products;

  // Methods
}
