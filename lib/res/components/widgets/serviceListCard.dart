import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class ServiceListCard extends StatelessWidget {
  final String imagePath;
  final String serviceTitle;
  final String providerName;
  final String price;
  final VoidCallback onBookNow;
  final VoidCallback onFavorite;

  const ServiceListCard({
    Key? key,
    required this.imagePath,
    required this.serviceTitle,
    required this.providerName,
    required this.price,
    required this.onBookNow,
    required this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.grey200, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: Row(
        children: [
          // Service Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Favorite
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        serviceTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: onFavorite,
                      icon: const Icon(Icons.star, color: AppColor.primary),
                    ),
                  ],
                ),

                // Provider Name
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: AppColor.textSecondary),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        providerName,
                        style: const TextStyle(
                            fontSize: 14, color: AppColor.textSecondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Price + Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: onBookNow,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
