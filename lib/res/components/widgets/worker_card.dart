import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_link/res/colors/app_color.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String profession;
  final String rating;
  final String distance;
  final String imageUrl;
  final VoidCallback onViewProfile;

  const WorkerCard({
    super.key,
    required this.name,
    required this.profession,
    required this.rating,
    required this.distance,
    required this.imageUrl,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: AppColor.grey100),
              errorWidget: (context, url, error) => const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            profession,
            style: const TextStyle(
              fontSize: 11,
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, color: AppColor.textHint, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    distance,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: OutlinedButton(
              onPressed: onViewProfile,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColor.primary, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                "View Profile",
                style: TextStyle(
                  fontSize: 11,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
