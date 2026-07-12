import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String email;

  const ProfileHeader({
    Key? key,
    required this.avatarPath,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.cardBackground,
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          children: [
            // Avatar
            const CircleAvatar(
              backgroundColor: AppColor.grey200,
              radius: 40,
              backgroundImage: NetworkImage("https://ik.imagekit.io/img4u/4b19d41e0ddf82539c2e239281939da495ccc7d5.png?updatedAt=1758465429790"),
            ),
            const SizedBox(height: 12),

            // Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimary,
              ),
            ),

            // Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
