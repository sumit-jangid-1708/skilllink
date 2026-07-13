import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon; // In a real app, this might be an image/SVG path
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
              border: isSelected 
                ? Border.all(color: AppColor.primary, width: 2)
                : Border.all(color: AppColor.grey100, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 32,
              color: isSelected ? AppColor.primary : AppColor.primary.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: AppColor.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
