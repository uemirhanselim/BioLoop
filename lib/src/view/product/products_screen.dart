import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/navigation_helper.dart';
import 'package:solution_challenge/src/view/delivery/maps_screen.dart';
import 'package:solution_challenge/src/view/product/add_product_screen.dart';
import 'package:solution_challenge/src/viewmodel/product/product_viewmodel.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductViewModel(),
      child: Consumer<ProductViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: kWhite,
            appBar: AppBar(
              title: Text(
                'Products',
                style: GoogleFonts.montserrat(
                  color: kMediumGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: kMediumGreen,
                  ),
                  onPressed: () {
                    navigatorPush(context, const AddProductScreen());
                  },
                ),
              ], // Logo rengine uygun yeşil
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  return _card(viewModel, index, context);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _card(ProductViewModel viewModel, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: kTextGrey.withOpacity(.5)),
          ],
          borderRadius: BorderRadius.circular(10.0),

          border: Border.all(
            color: kTextGrey.withOpacity(.5),
          ), // Border'ı kaldırır
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(
            viewModel.products[index]['type'],
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            viewModel.products[index]['name'],
            style: GoogleFonts.montserrat(
              color: kBlack,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          collapsedBackgroundColor: kWhite,
          backgroundColor: kWhite,
          collapsedTextColor: kBlack,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide.none,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide.none,
          ),
          textColor: kBlack,
          iconColor: kMediumGreen,
          childrenPadding: const EdgeInsets.only(bottom: 10),
          initiallyExpanded: false,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          color: kBlack,
                        ),
                        children: [
                          TextSpan(
                            text: "Location: ",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: viewModel.products[index]['location'],
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          color: kBlack,
                        ),
                        children: [
                          TextSpan(
                            text: "Amount: ",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${viewModel.products[index]['amount']} boxes",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          color: kBlack,
                        ),
                        children: [
                          TextSpan(
                            text: "Phone: ",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "${viewModel.products[index]['phone']}",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          color: kBlack,
                        ),
                        children: [
                          TextSpan(
                            text: "Date: ",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "${viewModel.products[index]['date']}",
                            style: GoogleFonts.montserrat(
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => kMediumGreen),
                          ),
                          onPressed: () {
                            navigatorPush(
                              context,
                              const MapsScreen(),
                            );
                          },
                          child: Text(
                            "Detail",
                            style: GoogleFonts.montserrat(
                              color: kWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
