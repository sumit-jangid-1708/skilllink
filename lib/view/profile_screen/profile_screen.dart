import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/utils/curved_background.dart';

import '../../res/colors/app_color.dart' show AppColor;
import '../../res/components/widgets/profileHeader.dart';
import '../../utils/top_action_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Column(
                children: [
                  TopActionBar(
                    leftIcon: Icons.arrow_back,
                    rightIcon: Icons.settings,
                    onRightTap: () => Get.toNamed('/settings'),
                  ),

                  SizedBox(height: 50),
                  ProfileHeader(
                    avatarPath: "assets/images/avatar.png",
                    name: "Jackson Henry",
                    email: "Example@gmail.com",
                  ),

                  Container(
                    width: double.infinity,
                    height: 400,
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.white30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Divider(
                            height: 1,
                            indent: 120,
                            endIndent: 120,
                            color: Colors.grey.shade200,
                            thickness: 8,
                            radius: BorderRadius.circular(20),
                          ),
                          SizedBox(height: 25),
                          _buildMenuItem(Icons.edit, "Edit Profile", () {}),
                          Divider(
                            height: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey.shade200,
                          ),
                          _buildMenuItem(
                            Icons.headset_mic,
                            "Help & Support",
                            () {},
                          ),
                          Divider(
                            height: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey.shade200,
                          ),
                          _buildMenuItem(Icons.star_border, "Favorite", () {}),
                          Divider(
                            height: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey.shade200,
                          ),
                          _buildMenuItem(
                            Icons.notifications_none,
                            "Notification",
                            () {},
                          ),
                          Divider(
                            height: 1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.grey.shade200,
                          ),
                          _buildMenuItem(Icons.logout, "Logout", () {}),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.white30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "About US",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms of Service",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
