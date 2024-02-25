import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/viewmodel/profile/profile_viewmodel.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Code Verification',
                style: GoogleFonts.montserrat(
                  color: kMediumGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leadingWidth: getDynamicWidth(context, 0.08),
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left_rounded,
                  size: getDynamicHeight(context, 0.044),
                  color: kMediumGreen,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getDynamicWidth(context, 0.06)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/otp.png',
                      height: getDynamicHeight(context, 0.3),
                      width: getDynamicWidth(context, 0.6),
                      color: kMediumGreen,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 5,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: getDynamicHeight(context, 0.07),
                          fieldWidth: getDynamicWidth(context, 0.14),
                          activeFillColor: kWhite,
                          inactiveFillColor: kWhite,
                          selectedFillColor: kWhite,
                          activeColor: kMediumGreen,
                          selectedColor: kMediumGreen,
                          inactiveColor: kMediumGreen),
                      cursorColor: kMediumGreen,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onChanged: (value) {},
                    ),
                    emptySpaceHeight(context, 0.32),
                    Text(
                      'Please verify the code given by the person coming to receive the delivery.',
                      style: GoogleFonts.montserrat(
                        color: kBlack,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                        fontSize: getDynamicHeight(context, 0.018),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    emptySpaceHeight(context, 0.02),
                    _button(context, "Verify"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _button(BuildContext context, String title) {
    return SizedBox(
      height: getDynamicHeight(context, 0.068),
      width: getDynamicWidth(context, 1),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => kMediumGreen),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              )),
          onPressed: () {},
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              color: kWhite,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
