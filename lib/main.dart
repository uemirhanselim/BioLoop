import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/src/view/auth/login_screen.dart';
import 'package:solution_challenge/src/view/delivery/maps_screen.dart';
import 'package:solution_challenge/src/view/delivery/otp_screen.dart';
import 'package:solution_challenge/src/view/home/home_screen.dart';
import 'package:solution_challenge/src/view/product/add_product_screen.dart';
import 'package:solution_challenge/src/view/product/products_screen.dart';
import 'package:solution_challenge/src/view/splash/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BioLoop',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
