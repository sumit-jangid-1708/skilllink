import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class StarScreen extends StatelessWidget {
  const StarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Text(
          "Saved Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
        ),
      ),
    );
  }
}
