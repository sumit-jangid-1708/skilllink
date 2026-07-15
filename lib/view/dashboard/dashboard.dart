import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Obx(() => IndexedStack(
            index: dashboardController.currentIndex.value,
            children: screens,
          )),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return NavigationBar(
      elevation: 3,
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primaryContainer,
      selectedIndex: dashboardController.currentIndex.value,
      onDestinationSelected: (index) => dashboardController.changeTab(index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.assignment_outlined),
          selectedIcon: Icon(Icons.assignment_rounded),
          label: 'Requests',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline_rounded),
          selectedIcon: Icon(Icons.favorite_rounded),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
