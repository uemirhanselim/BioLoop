import 'package:flutter/material.dart';

class AddProductViewModel extends ChangeNotifier {
  AddProductViewModel();

  // Setters
  final TextEditingController _giverNameController = TextEditingController();
  final TextEditingController _productNameController =
      TextEditingController(text: "Bread");
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Getters
  TextEditingController get giverNameController => _giverNameController;
  TextEditingController get productNameController => _productNameController;
  TextEditingController get amountController => _amountController;
  TextEditingController get locationController => _locationController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get dateController => _dateController;

  // Methods
}
