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
        body: Stack(
          children: [
            /// Main screen content
            Positioned.fill(
              child: screens[dashboardController.currentIndex.value],
            ),

            /// Floating Bottom Navigation Bar
            Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: customBottomBar(),
            ),
          ],
        ),
      );
    });
  }

  Widget customBottomBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => dashboardController.changeTab(index),
              child: Center(
                child: Obx(() {
                  final isSelected =
                      dashboardController.currentIndex.value == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutBack,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColor.white.withOpacity(0.9)
                          : Colors.transparent,
                    ),
                    child: Icon(
                      icons[index],
                      color: AppColor.darkGrey,
                      size: isSelected ? 32 : 28,
                    ),
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}
