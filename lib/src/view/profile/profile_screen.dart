import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/viewmodel/profile/profile_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Profile',
                style: GoogleFonts.montserrat(
                  color: kMediumGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('assets/image.jpg'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: kLightGreen,
                              ),
                              onPressed: () {
                                // Kamera veya galeriyi açmak için bir fonksiyon ekleyebilirsiniz.
                                // Örneğin:
                                // _openImagePicker();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _inputField("Name", TextEditingController(), context),
                    _inputField("Email", TextEditingController(), context),
                    _inputField(
                        "Phone Number", TextEditingController(), context),
                    _inputField("City", TextEditingController(), context),
                    emptySpaceHeight(context, 0.01),
                    _button(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _button(BuildContext context) {
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
            "Edit",
            style: GoogleFonts.montserrat(
              color: kWhite,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }

  Widget _inputField(
    String title,
    TextEditingController controller,
    BuildContext context, {
    bool isRow = false,
  }) {
    return SizedBox(
      width: getDynamicWidth(context, isRow ? 0.45 : 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: Colors.green,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            keyboardType: title == "Amount" || title == "Phone Number"
                ? TextInputType.number
                : TextInputType.text,
            inputFormatters: const [],
            decoration: InputDecoration(
              hintText: "Enter a $title",
              hintStyle: GoogleFonts.montserrat(
                color: Colors.grey,
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
                borderSide: const BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
