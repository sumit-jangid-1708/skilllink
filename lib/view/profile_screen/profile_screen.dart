import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/utils/curved_background.dart';

import '../../res/colors/app_color.dart' show AppColor;
import '../../res/components/widgets/profileHeader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                            color: AppColor.white,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                            color: AppColor.white,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.settings,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          Divider(height: 1,indent:120,endIndent: 120, color: Colors.grey.shade200, thickness: 8,radius: BorderRadius.circular(20)),
                          SizedBox(height: 25,),
                          _buildMenuItem(Icons.edit, "Edit Profile", (){}),
                          Divider(height: 1,indent:20,endIndent: 20, color: Colors.grey.shade200,),
                          _buildMenuItem(Icons.headset_mic, "Help & Support",(){}),
                          Divider(height: 1,indent:20,endIndent: 20, color: Colors.grey.shade200,),
                          _buildMenuItem(Icons.star_border, "Favorite", (){}),
                          Divider(height: 1,indent:20,endIndent: 20, color: Colors.grey.shade200,),
                          _buildMenuItem(Icons.notifications_none, "Notification", (){}),
                          Divider(height: 1,indent:20,endIndent: 20, color: Colors.grey.shade200,),
                          _buildMenuItem(Icons.logout, "Logout", (){}),
                        ],
                      ),
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
      onTap: onTap
    );
  }
}
