import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/model/chart/chart_model.dart';
import 'package:solution_challenge/src/model/chart/donate_model.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/utils/helper_methods.dart';
import 'package:solution_challenge/src/utils/navigation_helper.dart';
import 'package:solution_challenge/src/view/delivery/otp_screen.dart';
import 'package:solution_challenge/src/viewmodel/dashboard/dashboard_viewmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Text(
                      'Hello, ',
                      style: GoogleFonts.montserrat(
                        color: kMediumGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    emptySpaceWidth(context, 0.01),
                    Text(
                      'Hotel Riviera',
                      style: GoogleFonts.montserrat(
                        color: kBlack,
                        fontSize: getDynamicHeight(context, 0.027),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                backgroundColor: kLightGreen.withOpacity(0.2),
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getDynamicWidth(context, 0.03)),
                  child: Column(
                    children: [
                      emptySpaceHeight(context, 0.05),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Notifications",
                                style: GoogleFonts.montserrat(
                                  color: kMediumGreen,
                                  fontSize: getDynamicHeight(context, 0.03),
                                  fontWeight: FontWeight.w700,
                                )),
                            Stack(
                              children: [
                                const Icon(
                                  Icons.notifications,
                                  color: kMediumGreen,
                                ),
                                Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: kRemoveRed,
                                    radius: getDynamicWidth(context, 0.013),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: kBlack.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: getDynamicHeight(context, 0.4),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                children: [
                                  _notificationCard(context, 1),
                                  emptySpaceHeight(context, 0.01),
                                  _notificationCard(context, 2),
                                ],
                              ),
                            ),
                          )),
                      emptySpaceHeight(context, 0.05),
                      SizedBox(
                        height: getDynamicHeight(context, 0.5),
                        child: PageView(
                          children: [
                            _coPage(context, viewModel),
                            _donatePage(context, viewModel),
                          ],
                        ),
                      ),
                      emptySpaceHeight(context, 0.05)
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  GestureDetector _notificationCard(BuildContext context, int num) {
    return GestureDetector(
      onTap: () {
        navigatorPush(context, const OTPScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: getDynamicHeight(context, 0.19),
          decoration: BoxDecoration(
            color: kWhite,
            border: Border.all(
              color: kMediumGreen,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      num == 2 ? "Fruits" : "Bread",
                      style: GoogleFonts.montserrat(
                        color: kBlack,
                        fontSize: getDynamicHeight(context, 0.024),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              num == 1 ? Colors.yellow.shade800 : kMediumGreen,
                          radius: getDynamicWidth(context, 0.015),
                        ),
                        emptySpaceWidth(context, 0.01),
                        Text(
                          num == 1 ? "Pending" : "Active",
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: getDynamicHeight(context, 0.022),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amount:   ",
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          num == 1 ? "3 boxes" : "5 boxes",
                          style: GoogleFonts.montserrat(
                            color: kBlack.withOpacity(0.6),
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Location:   ",
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Alanya/Antalya",
                          style: GoogleFonts.montserrat(
                            color: kBlack.withOpacity(0.6),
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Date:   ",
                          style: GoogleFonts.montserrat(
                            color: kBlack,
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          num == 1
                              ? "2024-05-01 - 18:20"
                              : "2024-05-01 - 09:30",
                          style: GoogleFonts.montserrat(
                            color: kBlack.withOpacity(0.6),
                            fontSize: getDynamicHeight(context, 0.02),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _donatePage(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      children: [
        Text("Total Donations",
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              fontSize: getDynamicHeight(context, 0.03),
              fontWeight: FontWeight.w700,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kMediumGreen,
                              radius: getDynamicWidth(context, 0.02),
                            ),
                            emptySpaceWidth(context, 0.02),
                            Text("Total donations",
                                style: GoogleFonts.montserrat(
                                  color: kMediumGreen,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        emptySpaceHeight(context, 0.03),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: getDynamicWidth(context, 0.02),
                            ),
                            emptySpaceWidth(context, 0.02),
                            Text("Your donations",
                                style: GoogleFonts.montserrat(
                                  color: kMediumGreen,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getDynamicWidth(context, 0.5),
                      child: SfCircularChart(
                          margin: EdgeInsets.zero,
                          borderColor: Colors.transparent,
                          palette: const [
                            kMediumGreen,
                            kLightGreen,
                          ],
                          series: <CircularSeries<DonateModel, String>>[
                            DoughnutSeries<DonateModel, String>(
                              dataSource: viewModel.donate,
                              xValueMapper: (DonateModel data, _) => data.title,
                              yValueMapper: (DonateModel data, _) =>
                                  data.number,
                              explode: true,
                              explodeIndex: 1,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
                Text(
                  "You have made a great contribution to the environment!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: kBlack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _coPage(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      children: [
        Text("CO2 Emission",
            style: GoogleFonts.montserrat(
              color: kMediumGreen,
              fontSize: getDynamicHeight(context, 0.03),
              fontWeight: FontWeight.w700,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ColoredBox(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kMediumGreen,
                              radius: getDynamicWidth(context, 0.02),
                            ),
                            emptySpaceWidth(context, 0.02),
                            Text("Total value",
                                style: GoogleFonts.montserrat(
                                  color: kMediumGreen,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        emptySpaceHeight(context, 0.03),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kLightGreen,
                              radius: getDynamicWidth(context, 0.02),
                            ),
                            emptySpaceWidth(context, 0.02),
                            Text("Your value",
                                style: GoogleFonts.montserrat(
                                  color: kMediumGreen,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getDynamicWidth(context, 0.5),
                      child: SfCircularChart(
                          margin: EdgeInsets.zero,
                          borderColor: Colors.transparent,
                          palette: const [
                            kMediumGreen,
                            kLightGreen,
                          ],
                          series: <CircularSeries<ChartModel, String>>[
                            DoughnutSeries<ChartModel, String>(
                              dataSource: viewModel.data,
                              xValueMapper: (ChartModel data, _) => data.title,
                              yValueMapper: (ChartModel data, _) => data.number,
                              name: 'CO2 Emission',
                              explode: true,
                              explodeIndex: 1,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
                Text(
                  "Thanks to you, methane gas emissions from cows have decreased by 23% !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: kBlack,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
