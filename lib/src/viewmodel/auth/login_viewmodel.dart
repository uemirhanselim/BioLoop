import 'package:flutter/material.dart';
import 'package:solution_challenge/src/utils/navigation_helper.dart';
import 'package:solution_challenge/src/view/home/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  // Setters
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  bool _isLoading = false;

  // Getters
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isChecked => _isChecked;
  bool get isLoading => _isLoading;

  // Methods
  set setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    setIsLoading = true;
    await Future.delayed(const Duration(seconds: 2)).then((value) => navigatorPush(context, HomeScreen()));
    setIsLoading = false;
  }

//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     print('Signed in: ${userCredential.user!.email}');
//   } catch (e) {
//     print('Could not signed in: $e');
//   }
// }
}
