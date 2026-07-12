import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/category_grid_item.dart';
import 'package:skill_link/res/components/widgets/custom_search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        "title": "Plumbing",
        "subtitle": "Faucet, pipes, fittings, drainage & more",
        "icon": Icons.plumbing_rounded,
      },
      {
        "title": "Electrical",
        "subtitle": "Wiring, lighting, switches & more",
        "icon": Icons.bolt_rounded,
      },
      {
        "title": "Painting",
        "subtitle": "Wall painting, texture, polish & more",
        "icon": Icons.format_paint_rounded,
      },
      {
        "title": "AC Repair",
        "subtitle": "Installation, servicing, repair & more",
        "icon": Icons.ac_unit_rounded,
      },
      {
        "title": "Carpentry",
        "subtitle": "Furniture, doors, windows, fixing & more",
        "icon": Icons.handyman_rounded,
      },
      {
        "title": "Cleaning",
        "subtitle": "Home, office, deep cleaning & more",
        "icon": Icons.cleaning_services_rounded,
      },
      {
        "title": "Masonry",
        "subtitle": "Brick work, plaster, tile work & more",
        "icon": Icons.foundation_rounded,
      },
      {
        "title": "More Services",
        "subtitle": "Explore other available services",
        "icon": Icons.more_horiz_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          // Header Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF4C86FF),
                      Color(0xFF2E6FF2),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Choose a service category",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: -28,
                left: 20,
                right: 20,
                child: CustomSearchBar(hintText: "Search for services..."),
              ),
            ],
          ),

          const SizedBox(height: 45),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryGridItem(
                        title: categories[index]['title'],
                        subtitle: categories[index]['subtitle'],
                        icon: categories[index]['icon'],
                        onTap: () {},
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Bottom Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F0FF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.primary.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColor.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.verified_user_rounded, color: Colors.white, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Verified & Trusted Professionals",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "All our professionals are background verified and highly rated by customers.",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColor.textSecondary,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.chevron_right_rounded, color: AppColor.primary, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
