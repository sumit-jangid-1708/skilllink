import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class CustomProfileDropdown<T> extends StatelessWidget {
  final String label;
  final String hintText;
  final T? value;
  final List<T> items;
  final IconData prefixIcon;
  final void Function(T?) onChanged;

  const CustomProfileDropdown({
    super.key,
    required this.label,
    required this.hintText,
    this.value,
    required this.items,
    required this.prefixIcon,
    required this.onChanged,
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
                DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    isExpanded: true,
                    isDense: true,
                    value: value,
                    hint: Text(
                      hintText,
                      style: const TextStyle(
                        color: AppColor.textHint,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.textSecondary, size: 20),
                    items: items.map((T item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: const TextStyle(
                            color: AppColor.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
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
