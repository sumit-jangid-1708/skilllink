import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class CustomProfileTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomProfileTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.grey200),
      ),
      child: Row(
        children: [
          Icon(prefixIcon, color: AppColor.textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColor.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  readOnly: readOnly,
                  onTap: onTap,
                  style: const TextStyle(
                    color: AppColor.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: AppColor.textHint,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
