import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/viewmodel/product/add_product_viewmodel.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddProductViewModel(),
      child: Consumer<AddProductViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: kWhite,
            appBar: AppBar(
              title: Text(
                'Add Product',
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
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    emptySpaceHeight(context, 0.03),
                    _inputField("Contact Person", viewModel.giverNameController,
                        context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _expandableField(context, isRow: true, viewModel),
                        _inputField(
                            "Amount", viewModel.amountController, context,
                            isRow: true),
                      ],
                    ),
                    _mapsField(context, viewModel),
                    _inputField("Phone Number", viewModel.phoneNumberController,
                        context),
                    _dateField(context, viewModel),
                    emptySpaceHeight(context, 0.16),
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
            "Add Product",
            style: GoogleFonts.montserrat(
              color: kWhite,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }

  Widget _inputField(
      String title, TextEditingController controller, BuildContext context,
      {bool isRow = false}) {
    return SizedBox(
      width: getDynamicWidth(context, isRow ? 0.45 : 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w700,
            ),
          ),
          emptySpaceHeight(context, 0.01),
          TextFormField(
            style: GoogleFonts.montserrat(
              color: kBlack,
              fontWeight: FontWeight.w600,
            ),
            keyboardType: title == "Amount" || title == "Phone Number"
                ? TextInputType.number
                : TextInputType.text,
            inputFormatters: const [],
            decoration: InputDecoration(
              hintText: "Enter a $title",
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
          ),
          emptySpaceHeight(context, 0.02),
        ],
      ),
    );
  }

  Widget _expandableField(BuildContext context, AddProductViewModel viewModel,
      {bool isRow = false}) {
    return SizedBox(
      width: getDynamicWidth(context, isRow ? 0.45 : 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product",
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              fontSize: getDynamicHeight(context, 0.02),
              fontWeight: FontWeight.w700,
            ),
          ),
          emptySpaceHeight(context, 0.01),
          DropdownButtonFormField<String>(
            value: viewModel.productNameController.text,
            onChanged: (String? newValue) {
              viewModel.productNameController.text = newValue!;
            },
            alignment: Alignment.centerLeft,
            style: GoogleFonts.montserrat(
              color: kBlack,
              fontWeight: FontWeight.w600,
            ),
            items: <String>['Bread', 'Manure', "Dessert", "Fruit", "Food"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
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
          ),
          emptySpaceHeight(context, 0.02),
        ],
      ),
    );
  }

  Column _mapsField(BuildContext context, AddProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: GoogleFonts.montserrat(
            color: kMediumGreen,
            fontSize: getDynamicHeight(context, 0.02),
            fontWeight: FontWeight.w700,
          ),
        ),
        emptySpaceHeight(context, 0.01),
        TextFormField(
          readOnly: true,
          controller: viewModel.locationController,
          style: GoogleFonts.montserrat(
            color: kBlack,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: "Alanya/Antalya Petra st.",
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
            suffixIcon: IconButton(
              icon:
                  const Icon(Icons.chevron_right_outlined, color: kMediumGreen),
              onPressed: () {
                // Buraya tıklandığında yapılacak işlemler
              },
            ),
          ),
        ),
        emptySpaceHeight(context, 0.02),
      ],
    );
  }

  Widget _dateField(BuildContext context, AddProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: GoogleFonts.montserrat(
            color: kMediumGreen,
            fontSize: getDynamicHeight(context, 0.02),
            fontWeight: FontWeight.w700,
          ),
        ),
        emptySpaceHeight(context, 0.01),
        TextFormField(
          readOnly: true,
          controller: viewModel.dateController,
          style: GoogleFonts.montserrat(
            color: kBlack,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: "Choose a date",
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
            suffixIcon: IconButton(
              icon:
                  const Icon(Icons.chevron_right_outlined, color: kMediumGreen),
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  viewModel.dateController.text =
                      date.toString().substring(0, 10);
                }
              },
            ),
          ),
        ),
        emptySpaceHeight(context, 0.02),
      ],
    );
  }
}
