import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/components/widgets/category_card.dart';
import 'package:skill_link/res/components/widgets/custom_search_bar.dart';
import 'package:skill_link/res/components/widgets/worker_card.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with MD3 Styling
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
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good morning,",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                "Rahul Kumar",
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              _buildHeaderAction(context, Icons.notifications_none_rounded),
                              const SizedBox(width: 12),
                              _buildHeaderAction(context, Icons.person_outline_rounded),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            "Koramangala, Bengaluru 560034",
                            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                          ),
                          // const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 18),
                        ],
                      ),
                    ],
                  ),
                ),
                // Floating Search Bar
                const Positioned(
                  bottom: -28,
                  left: 20,
                  right: 20,
                  child: CustomSearchBar(),
                ),
              ],
            ),

            const SizedBox(height: 48),

            // Offer Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "NEW USERS",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "First Service\nFREE!",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Book any service today",
                            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: const Text("Book Now", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            // Carousel Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(context, true),
                _buildDot(context, false),
                _buildDot(context, false),
              ],
            ),

            const SizedBox(height: 32),

            // Categories Section
            _buildSectionHeader(context, "Categories", () {
              Get.toNamed(RouteName.categoriesScreen);
            }),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CategoryCard(title: "Plumbing", icon: Icons.plumbing_rounded, isSelected: true, onTap: () {}),
                  const SizedBox(width: 16),
                  CategoryCard(title: "Electric", icon: Icons.bolt_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  CategoryCard(title: "Painting", icon: Icons.format_paint_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  CategoryCard(title: "AC Repair", icon: Icons.ac_unit_rounded, onTap: () {}),
                  const SizedBox(width: 16),
                  CategoryCard(title: "Carpentry", icon: Icons.handyman_rounded, onTap: () {}),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Top Workers Section
            _buildSectionHeader(context, "Top Workers Nearby", () {}),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  WorkerCard(
                    name: "Suresh M.",
                    profession: "Expert Plumber",
                    rating: "4.6",
                    distance: "2.3 km",
                    imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                    onViewProfile: () { Get.toNamed(RouteName.workerProfileScreen);},
                  ),
                  const SizedBox(width: 16),
                  WorkerCard(
                    name: "Arjun D.",
                    profession: "Electrician",
                    rating: "4.7",
                    distance: "2.1 km",
                    imageUrl: "https://randomuser.me/api/portraits/men/44.jpg",
                    onViewProfile: () {},
                  ),
                  const SizedBox(width: 16),
                  WorkerCard(
                    name: "Vijay B.",
                    profession: "AC Technician",
                    rating: "4.5",
                    distance: "3.0 km",
                    imageUrl: "https://randomuser.me/api/portraits/men/85.jpg",
                    onViewProfile: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32), // Padding before bottom of scroll
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderAction(BuildContext context, IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.15),
        shape: const CircleBorder(),
        side: BorderSide(color: Colors.white.withOpacity(0.2)),
        minimumSize: const Size(48, 48),
      ),
    );
  }

  Widget _buildDot(BuildContext context, bool isActive) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 24 : 6,
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary : colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback onSeeAll) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            style: TextButton.styleFrom(
              minimumSize: const Size(48, 48),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View All",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_rounded, size: 16, color: colorScheme.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
