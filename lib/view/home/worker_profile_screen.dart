import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view_models/controller/worker_profile_controller.dart';

class WorkerProfileScreen extends StatelessWidget {
  WorkerProfileScreen({super.key});

  final controller = Get.put(WorkerProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildSliverAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9FAFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 35),
                        _buildSectionHeader("About", showViewAll: false),
                        const SizedBox(height: 12),
                        const Text(
                          "Professional plumber with 8+ years of experience in all types of plumbing services. Expert in pipe fitting, bathroom fittings, leak repair, and water tank installation.",
                          style: TextStyle(
                            color: Color(0xFF6A6A6A),
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 25),

                        const Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A1D1E),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _buildServiceChip("Pipe Fitting"),
                            _buildServiceChip("Leak Repair"),
                            _buildServiceChip("Bathroom Fittings"),
                            _buildServiceChip("Drain Cleaning"),
                            _buildServiceChip("Water Tank Installation"),
                            _buildServiceChip("Tap Repair"),
                          ],
                        ),
                        const SizedBox(height: 25),

                        _buildSectionHeader("Pricing", showViewAll: true),
                        const SizedBox(height: 15),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              _buildPriceCard(
                                icon: Icons.build_outlined,
                                title: "Basic Visit Charge",
                                price: "₹150",
                                desc: "Inspection & basic assessment",
                              ),
                              const SizedBox(width: 15),
                              _buildPriceCard(
                                icon: Icons.plumbing_outlined,
                                title: "Pipe Fitting",
                                price: "₹250 - ₹500",
                                desc: "Per fitting (Material extra)",
                              ),
                              const SizedBox(width: 15),
                              _buildPriceCard(
                                icon: Icons.water_drop_outlined,
                                title: "Leak Repair",
                                price: "₹300 - ₹800",
                                desc: "Depends on complexity",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),

                        _buildSectionHeader("Reviews (128)", showViewAll: true),
                        const SizedBox(height: 15),
                        _buildReviewCard(),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildBottomActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF4C86FF),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Blue Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4C86FF), Color(0xFF2E6FF2)],
                ),
              ),
            ),
            // Decorative Background Shape
            Positioned(
              right: -60,
              top: 60,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white.withOpacity(0.05),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // 1. Top Buttons Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCircleIconButton(Icons.arrow_back, () => Get.back()),
                        Row(
                          children: [
                            _buildCircleIconButton(Icons.ios_share, () {}),
                            const SizedBox(width: 12),
                            Obx(() => _buildCircleIconButton(
                              controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                              controller.toggleFavorite,
                              iconColor: controller.isFavorite.value ? Colors.red : Colors.white,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 2. Profile Info Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Worker Image Card
                        Container(
                          width: 135,
                          height: 160,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: CachedNetworkImage(
                                  imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(color: Color(0xFF2ECC71), shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Available Now",
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF2ECC71),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Name and Rating Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Suresh M.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(Icons.verified, color: Colors.white, size: 20),
                                ],
                              ),
                              const Text(
                                "Expert Plumber",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Color(0xFFFFB020), size: 18),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "4.6",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(width: 1.5, height: 14, color: Colors.white30),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "128 Reviews",
                                    style: TextStyle(color: Colors.white70, fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // 3. Exact Stats Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildExactStatsCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIconButton(IconData icon, VoidCallback onTap, {Color iconColor = Colors.white}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Icon(icon, color: iconColor, size: 22),
        ),
      ),
    );
  }

  Widget _buildExactStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildExactStatItem(Icons.business_center_outlined, "8+", "Years Exp."),
          _buildStatDivider(),
          _buildExactStatItem(Icons.location_on_outlined, "2.3 km", "From you"),
          _buildStatDivider(),
          _buildExactStatItem(Icons.verified_user_outlined, "Verified", "Professional"),
        ],
      ),
    );
  }

  Widget _buildExactStatItem(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, size: 22, color: const Color(0xFF4C86FF)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
                color: Color(0xFF1A1D1E),
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFADB5BD),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 30,
      width: 1,
      color: const Color(0xFFE9ECEF),
    );
  }

  Widget _buildSectionHeader(String title, {required bool showViewAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1D1E),
          ),
        ),
        if (showViewAll)
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  "View All",
                  style: TextStyle(
                    color: Color(0xFF4C86FF),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.chevron_right, size: 18, color: Color(0xFF4C86FF)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildServiceChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F7FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5EEFF)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF4C86FF),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPriceCard({required IconData icon, required String title, required String price, required String desc}) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9ECEF), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF2F7FF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF4C86FF), size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1A1D1E)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4C86FF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(color: Color(0xFF6A6A6A), fontSize: 11, height: 1.3),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F7FF),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              "R",
              style: TextStyle(color: Color(0xFF4C86FF), fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Rohit Sharma",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1A1D1E)),
                    ),
                    Text(
                      "2 days ago",
                      style: TextStyle(color: Color(0xFFADB5BD), fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(Icons.star, color: Color(0xFFFFB020), size: 14),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Great service! Fixed the leakage quickly and very professional behavior.",
                  style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionButtons() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE9ECEF)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => controller.startChat(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat_bubble_outline, size: 20, color: Color(0xFF4C86FF)),
                      SizedBox(width: 10),
                      Text(
                        "Chat",
                        style: TextStyle(
                          color: Color(0xFF4C86FF),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 2,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF4C86FF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4C86FF).withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => controller.bookNow(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.calendar_today_outlined, size: 20, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
