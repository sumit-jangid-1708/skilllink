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
    Icons.star_border_outlined,
    Icons.bookmark_outline_outlined,
    Icons.perm_identity_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      MapScreen(),
      StarScreen(),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        // color: const Color(0xFF1C1C1E),  dark background (like iOS)
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(30),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            final isSelected = dashboardController.currentIndex.value == index;

            return GestureDetector(
              onTap: () => dashboardController.changeTab(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColor.mainColor.withOpacity(0.15)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons[index],
                  color:
                  isSelected ? AppColor.mainColor : Colors.grey.shade400,
                  size: isSelected ? 30 : 26,
                ),
              ),
            );
          }),
        );
      }),
    );
  }

}
