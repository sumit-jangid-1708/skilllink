import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100, // Smaller card width
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.grey200, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50, // Smaller image size
              width: 50,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10, // Compact text size
                fontWeight: FontWeight.w500,
                color: AppColor.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
