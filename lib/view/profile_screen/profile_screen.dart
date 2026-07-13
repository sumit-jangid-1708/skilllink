import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/profile_option_tile.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Overlapping Profile Card
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Blue Gradient Header
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF4C86FF),
                        Color(0xFF2E6FF2),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.settings_outlined, color: Colors.white, size: 22),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Manage your account and preferences",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // Overlapping Profile Card
                Positioned(
                  bottom: -60,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F0FF),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                              child: const Icon(Icons.person_rounded, size: 50, color: AppColor.primary),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: AppColor.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, size: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rahul Kumar",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.phone_outlined, size: 16, color: AppColor.primary),
                                SizedBox(width: 8),
                                Text(
                                  "+91 98765 43210",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80), // Space for the overlapping card

            // Sections
            _buildSectionHeader("ACCOUNT"),
            _buildSectionCard([
              ProfileOptionTile(
                title: "Edit Profile",
                icon: Icons.edit_outlined,
                iconBgColor: const Color(0xFFE8F0FF),
                iconColor: AppColor.primary,
                onTap: () {
                  Get.toNamed(RouteName.editProfileScreen);
                },
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: AppColor.grey100),
              ProfileOptionTile(
                title: "My Requests",
                icon: Icons.assignment_outlined,
                iconBgColor: const Color(0xFFE8F0FF),
                iconColor: AppColor.primary,
                onTap: () {},
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: AppColor.grey100),
              ProfileOptionTile(
                title: "Saved Workers",
                icon: Icons.favorite_rounded,
                iconBgColor: const Color(0xFFE7F7EF),
                iconColor: Colors.green,
                onTap: () {},
              ),
            ]),

            _buildSectionHeader("SUPPORT"),
            _buildSectionCard([
              ProfileOptionTile(
                title: "Help & Support",
                icon: Icons.headset_mic_outlined,
                iconBgColor: const Color(0xFFE8F0FF),
                iconColor: AppColor.primary,
                onTap: () {},
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: AppColor.grey100),
              ProfileOptionTile(
                title: "Rate the App",
                icon: Icons.star_outline_rounded,
                iconBgColor: const Color(0xFFFFF4E5),
                iconColor: Colors.orange,
                onTap: () {},
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: AppColor.grey100),
              ProfileOptionTile(
                title: "Privacy Policy",
                icon: Icons.article_outlined,
                iconBgColor: const Color(0xFFE7F7EF),
                iconColor: Colors.green,
                onTap: () {},
              ),
            ]),

            _buildSectionHeader("SESSION"),
            _buildSectionCard([
              ProfileOptionTile(
                title: "Logout",
                icon: Icons.logout_rounded,
                iconBgColor: const Color(0xFFFFEBEE),
                iconColor: Colors.red,
                isDestructive: true,
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 20),
            const Text(
              "SkillLink v1.0.0 • Made with ❤️",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.textSecondary,
              ),
            ),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColor.textHint,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.grey100, width: 1),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
