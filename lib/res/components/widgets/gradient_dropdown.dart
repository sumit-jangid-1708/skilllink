import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class GradientDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final IconData? prefixIcon;

  const GradientDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            // AppColor.primaryLight,
            AppColor.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.8), // gradient border thickness
        decoration: BoxDecoration(
          color: AppColor.cardBackground,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              hint: Row(
                children: [
                  if (prefixIcon != null)
                    Icon(prefixIcon, color: AppColor.primary),
                  if (prefixIcon != null) const SizedBox(width: 8),
                  Text(
                    hintText,
                    style: const TextStyle(
                      color: AppColor.textHint,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              items: items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    item.toString(),
                    style: const TextStyle(fontSize: 16, color: AppColor.textPrimary),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon: const Icon(Icons.arrow_drop_down, color: AppColor.primary),
              dropdownColor: AppColor.cardBackground,
            ),
          ),
        ),
      ),
    );
  }
}
