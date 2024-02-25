import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/viewmodel/splash/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(context),
      child: Consumer<SplashViewModel>(
        builder: (context, viewModel, _) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: kWhite,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/applogo.png',
                      height: getDynamicHeight(context, 0.2),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "BioLoop",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kMediumGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
