import 'package:flutter/material.dart';
import 'package:solution_challenge/src/utils/navigation_helper.dart';
import 'package:solution_challenge/src/view/auth/login_screen.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel(BuildContext context) {
    init(context);
  }

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => navigatorPush(context, LoginScreen()));
    // Navigator.pushReplacementNamed(context, '/login');
  }
}
