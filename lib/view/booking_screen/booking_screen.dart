import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Text(
          "Requests Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
        ),
      ),
    );
  }
}
