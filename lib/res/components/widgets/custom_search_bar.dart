import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search plumbers, electricians...",
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.textHint,
            fontSize: 14,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColor.primary,
            size: 28,
          ),
          suffixIcon: InkWell(
            onTap: onFilterTap,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.tune_rounded, // or Icons.filter_list_rounded
                color: AppColor.textPrimary,
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
