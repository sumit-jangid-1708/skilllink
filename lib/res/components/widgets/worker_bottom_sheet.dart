import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class WorkerBottomSheet extends StatelessWidget {
  final String name;
  final VoidCallback onClose;

  const WorkerBottomSheet({
    super.key,
    required this.name,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        border: const Border(top: BorderSide(color: AppColor.grey200)),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, color: AppColor.textSecondary),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "⭐ 4.0   |   ₹10/hour   |   18 min drive",
            style: TextStyle(color: AppColor.textSecondary),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColor.grey200,
                  backgroundImage: AssetImage('assets/images/offerImage.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Experienced electrician for home and office wiring jobs.",
                    style: TextStyle(fontSize: 14, color: AppColor.textPrimary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                "Book Now",
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
