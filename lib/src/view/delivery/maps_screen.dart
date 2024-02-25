import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/view/widget/shimmers.dart';
import 'package:solution_challenge/src/viewmodel/delivery/maps_viewodel.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapsViewModel(),
      child: Consumer<MapsViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  '#29073',
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
                child: Column(
                  children: [
                    viewModel.isLoading ? _shimmer(context) : _mapView(),
                    emptySpaceHeight(context, 0.012),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getDynamicWidth(context, 0.03)),
                      child: Column(
                        children: [
                          _infoCard(context),
                          emptySpaceHeight(context, 0.03),
                          //_button(context, "Verify Delivery Number"),
                          emptySpaceHeight(context, 0.08),
                          _button(context, "Cancel"),
                          emptySpaceHeight(context, 0.015),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _shimmer(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SkeletonShimmer(
              height: getDynamicHeight(context, 0.6),
              width: getDynamicWidth(context, 1)),
        ],
      ),
    );
  }

  Card _infoCard(BuildContext context) {
    return Card(
      color: kWhite.withOpacity(0.8),
      child: Padding(
        padding: EdgeInsets.all(getDynamicHeight(context, 0.012)),
        child: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: kLightGreen,
              size: getDynamicHeight(context, 0.032),
            ),
            emptySpaceWidth(context, 0.05),
            Expanded(
              child: Text(
                'Please give your delivery code to the person who delivers the product!',
                style: GoogleFonts.montserrat(
                  color: kBlack,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  fontSize: getDynamicHeight(context, 0.018),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _button(BuildContext context, String title) {
    return SizedBox(
      height: getDynamicHeight(context, 0.068),
      width: getDynamicWidth(context, 1),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => title == "Cancel" ? kRed : kMediumGreen),
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              )),
          onPressed: () {
            if (title == "Cancel") {
            } else {}
          },
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

  SizedBox _mapView() {
    return SizedBox(
      height: 480,
      width: double.infinity,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(36.543070349860564, 31.99889706719196),
          zoom: 14.4746,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('1'),
            position: LatLng(36.543070349860564, 31.99889706719196),
            infoWindow: InfoWindow(
              title: 'Melodiy City Hotel',
              snippet: 'Bread',
            ),
            visible: true,
          ),
        },
        rotateGesturesEnabled: true,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
      ),
    );
  }
}
