import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view/booking_screen/booking_screen.dart';
import 'package:skill_link/view/map_screen/map_screen.dart';
import 'package:skill_link/view/profile_screen/profile_screen.dart';
import 'package:skill_link/view/star_screen/star_screen.dart';
import '../../view_models/controller/dashboard_controller.dart';
import '../home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );

  DashboardScreen({super.key});

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.location_on_outlined,
    // Icons.star_border_outlined,
    Icons.bookmark_outline_outlined,
    Icons.perm_identity_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      MapScreen(),
      // StarScreen(),
      BookingScreen(),
      ProfileScreen(),
    ];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            /// Main content
            Expanded(
              child: screens[dashboardController.currentIndex.value],
            ),

            /// Fixed bottom navigation bar
            customBottomBar(),
          ],
        ),
      );
    });
  }

  Widget customBottomBar() {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.darkGrey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = dashboardController.currentIndex.value == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => dashboardController.changeTab(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColor.white.withOpacity(0.9)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  icons[index],
                  color: isSelected ? AppColor.darkGrey : Colors.white,
                  size: isSelected ? 30 : 26,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
