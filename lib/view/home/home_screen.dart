import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/category_card.dart';
import 'package:skill_link/res/components/widgets/custom_search_bar.dart';
import 'package:skill_link/res/components/widgets/worker_card.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Blue Gradient
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 280,
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
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Good morning,",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rahul Kumar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              _buildHeaderAction(Icons.notifications_none_rounded),
                              const SizedBox(width: 12),
                              _buildHeaderAction(Icons.person_outline_rounded),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Icon(Icons.location_on_rounded, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Koramangala, Bengaluru 560034",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 18),
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

            const SizedBox(height: 50),

            // Offer Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0052D4), Color(0xFF4364F7), Color(0xFF6FB1FC)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "NEW USERS",
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "First Service\nFREE!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Book any service today",
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Book Now", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            // Carousel Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(true),
                _buildDot(false),
                _buildDot(false),
              ],
            ),

            const SizedBox(height: 24),

            // Categories Section
            _buildSectionHeader("Categories", () {
              Get.toNamed(RouteName.categoriesScreen);
            }),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
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
                  const SizedBox(width: 16),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Top Workers Section
            _buildSectionHeader("Top Workers Nearby", () {}),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                children: [
                  WorkerCard(
                    name: "Suresh M.",
                    profession: "Expert Plumber",
                    rating: "4.6",
                    distance: "2.3 km",
                    imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                    onViewProfile: () {},
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
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderAction(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: isActive ? 18 : 6,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primary : AppColor.grey200,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.textPrimary,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: Row(
              children: const [
                Text(
                  "View All",
                  style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_rounded, size: 16, color: AppColor.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
