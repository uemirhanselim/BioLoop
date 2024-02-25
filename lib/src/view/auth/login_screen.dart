import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/viewmodel/auth/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getDynamicWidth(context, 0.05)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/applogo.png',
                      height: getDynamicHeight(context, 0.2),
                    ),
                    emptySpaceHeight(context, 0.1),
                    _inputField(viewModel, context, true),
                    emptySpaceHeight(context, 0.02),
                    _inputField(viewModel, context, false),
                    _forgotPass(viewModel, context),
                    emptySpaceHeight(context, 0.03),
                    _button(context, viewModel),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _button(BuildContext context, LoginViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: viewModel.emailController.text.isEmpty ||
                  viewModel.passwordController.text.isEmpty
              ? kMediumGreen.withOpacity(0.4)
              : kMediumGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: viewModel.emailController.text.isEmpty ||
                viewModel.passwordController.text.isEmpty
            ? null
            : () async {
                await viewModel.login(context);
              },
        child: viewModel.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kWhite,
                ),
              )
            : Text(
                'Login',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: getDynamicHeight(context, 0.02),
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Row _forgotPass(LoginViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getDynamicWidth(context, 0.01)),
          child: Row(
            children: [
              SizedBox(
                height: getDynamicHeight(context, 0.03),
                width: getDynamicHeight(context, 0.02),
                child: Checkbox(
                    value: viewModel.isChecked,
                    activeColor: kMediumGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    onChanged: (value) {
                      viewModel.setIsChecked = value!;
                    }),
              ),
              emptySpaceWidth(context, 0.015),
              Text(
                'Remember me',
                style: GoogleFonts.montserrat(
                  color: kBlack.withOpacity(0.7),
                  letterSpacing: 0,
                  fontSize: getDynamicHeight(context, 0.018),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            // Forgot password button pressed
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              letterSpacing: 0.2,
              fontSize: getDynamicHeight(context, 0.018),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputField(LoginViewModel viewModel, BuildContext context, isMail) {
    return TextFormField(
      controller:
          isMail ? viewModel.emailController : viewModel.passwordController,
      obscureText: !isMail,
      cursorColor: kMediumGreen,
      decoration: InputDecoration(
        prefixIcon:
            Icon(isMail ? Icons.email : Icons.lock, color: kMediumGreen),
        hintText: isMail ? "Email" : "Password",
        hintStyle: GoogleFonts.montserrat(
          color: kTextGrey,
          fontSize: getDynamicHeight(context, 0.018),
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kMediumGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kMediumGreen),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kRemoveRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kRemoveRed),
        ),
      ),
    );
  }
}
