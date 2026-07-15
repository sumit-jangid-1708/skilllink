import 'package:flutter/material.dart';
import 'package:skill_link/res/components/widgets/category_grid_item.dart';
import 'package:skill_link/res/components/widgets/custom_search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          // Header Section
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withBlue(255),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 64),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        minimumSize: const Size(48, 48),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Categories",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Choose a service category",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
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

          const SizedBox(height: 48),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Categories",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.0,
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
                  const SizedBox(height: 24),
                  // Bottom Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colorScheme.primary.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.verified_user_rounded, color: Colors.white, size: 24),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Verified Professionals",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "All our professionals are background verified and highly rated.",
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.chevron_right_rounded, color: colorScheme.primary),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
