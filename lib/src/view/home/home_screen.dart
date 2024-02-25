import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/src/utils/constants.dart';
import 'package:solution_challenge/src/view/dashboard/dashboard_screen.dart';
import 'package:solution_challenge/src/view/product/add_product_screen.dart';
import 'package:solution_challenge/src/view/product/products_screen.dart';
import 'package:solution_challenge/src/view/profile/profile_screen.dart';
import 'package:solution_challenge/src/viewmodel/dashboard/dashboard_viewmodel.dart';
import 'package:solution_challenge/src/viewmodel/home/home_viewmodel.dart';
import 'package:solution_challenge/src/viewmodel/product/add_product_viewmodel.dart';
import 'package:solution_challenge/src/viewmodel/product/product_viewmodel.dart';
import 'package:solution_challenge/src/viewmodel/profile/profile_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: kWhite,
            body: _screens[viewModel.selectedIndex],
            bottomNavigationBar: CircleNavBar(
              activeIndex: viewModel.selectedIndex,
              activeIcons: const [
                Icon(Icons.dashboard_outlined, color: kLightGreen),
                Icon(Icons.corporate_fare_outlined, color: kLightGreen),
                Icon(Icons.person_outline, color: kLightGreen),
              ],
              inactiveIcons: const [
                Icon(Icons.dashboard_outlined, color: kDarkGreen),
                Icon(Icons.corporate_fare_outlined, color: kDarkGreen),
                Icon(Icons.person_outline, color: kDarkGreen),
              ],
              height: 60,
              circleWidth: 60,
              color: kWhite,
              onTap: (index) {
                viewModel.setSelectedIndex = index;
              },
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              cornerRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
              ),
              shadowColor: kTextGrey,
              elevation: 10,
            ),
          );
        },
      ),
    );
  }

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ProductsScreen(),
    const ProfileScreen(),
  ];
}
