import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view/booking_screen/requests_screen.dart';
import 'package:skill_link/view/home/home_screen.dart';
import 'package:skill_link/view/profile_screen/profile_screen.dart';
import 'package:skill_link/view/star_screen/star_screen.dart';
import '../../view_models/controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController dashboardController = Get.put(DashboardController());

  final List<Widget> screens = [
    const HomeScreen(),
    const RequestsScreen(),
    const StarScreen(),
    const ProfileScreen(),
  ];

  final List<Map<String, dynamic>> navItems = [
    {
      'label': 'Home',
      'icon': Icons.home_outlined,
      'activeIcon': Icons.home_rounded,
    },
    {
      'label': 'Requests',
      'icon': Icons.assignment_outlined,
      'activeIcon': Icons.assignment_rounded,
    },
    {
      'label': 'Saved',
      'icon': Icons.favorite_outline_rounded,
      'activeIcon': Icons.favorite_rounded,
    },
    {
      'label': 'Profile',
      'icon': Icons.person_outline_rounded,
      'activeIcon': Icons.person_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(() => IndexedStack(
            index: dashboardController.currentIndex.value,
            children: screens,
          )),
      bottomNavigationBar: customBottomBar(),
    );
  }

  Widget customBottomBar() {
    return Container(
      height: 88,
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 25,
            spreadRadius: 0,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Obx(
              () => Row(
            children: List.generate(navItems.length, (index) {
              final isSelected =
                  dashboardController.currentIndex.value == index;

              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => dashboardController.changeTab(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isSelected
                              ? navItems[index]['activeIcon']
                              : navItems[index]['icon'],
                          key: ValueKey(isSelected),
                          size: 25,
                          color: isSelected
                              ? AppColor.primary
                              : AppColor.grey500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        navItems[index]['label'],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isSelected
                              ? AppColor.primary
                              : AppColor.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
