import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/status_stepper.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF), // Matches light background in image
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeader(context),
                Positioned(
                  bottom: -65, // Exact half-half overlap as requested
                  left: 16,
                  right: 16,
                  child: _buildServiceSummaryCard(),
                ),
              ],
            ),
            const SizedBox(height: 80), // Space for the overlapping card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Request Status",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1D1E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatusStepperWidget(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Service Professional",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1D1E),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View Profile →",
                          style: TextStyle(
                            color: Color(0xFF1E60FF),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildProfessionalCard(),
                  const SizedBox(height: 24),
                  const Text(
                    "Service Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1D1E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildServiceDetailsCard(),
                  const SizedBox(height: 24),
                  const Text(
                    "Bill Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1D1E),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBillDetailsCard(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActionButtons(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E60FF),
            Color(0xFF2F80ED),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular Back Button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(width: 16),
          // Title and Subtitle
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 4),
                Text(
                  "Request Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Track your service request",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Support Button
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.headset_mic_outlined, color: Colors.white, size: 22),
              ),
              const SizedBox(height: 4),
              const Text(
                "Support",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Image Icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.water_drop, color: Color(0xFF1E60FF), size: 32),
          ),
          const SizedBox(width: 12),
          // Middle Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Kitchen Tap Leakage",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1D1E),
                  ),
                ),
                const Text(
                  "Plumbing",
                  style: TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Color(0xFF1E60FF)),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Koramangala, Bengaluru 560034",
                        style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.calendar_month, size: 14, color: Color(0xFF1E60FF)),
                    SizedBox(width: 4),
                    Text(
                      "12 May 2024  •  10:00 AM",
                      style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right Status and Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Accepted",
                  style: TextStyle(
                    color: Color(0xFF1E60FF),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "₹350",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1E60FF),
                ),
              ),
              const SizedBox(height: 2),
              InkWell(
                onTap: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View Invoice",
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 14, color: Color(0xFF6A6A6A)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStepperWidget() {
    return StatusStepper(
      currentStep: 1,
      steps: [
        StepData(title: "Requested", time: "09:15 AM", icon: Icons.assignment_outlined),
        StepData(title: "Accepted", time: "09:25 AM", icon: Icons.check_circle),
        StepData(title: "On The Way", time: "09:45 AM", icon: Icons.person_outline),
        StepData(title: "In Progress", time: "10:10 AM", icon: Icons.build_outlined),
        StepData(title: "Completed", time: "-", icon: Icons.check_circle_outline),
      ],
    );
  }

  Widget _buildProfessionalCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: 'https://images.unsplash.com/photo-1540560085022-d8cdd038b32c?w=150',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Suresh M.",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, color: Color(0xFF1E60FF), size: 16),
                  ],
                ),
                const Text(
                  "Expert Plumber",
                  style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 13),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(" 4.6 ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text("(128 Reviews)", style: TextStyle(fontSize: 12, color: Color(0xFF6A6A6A))),
                  ],
                ),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    Icon(Icons.security, color: Color(0xFF1E60FF), size: 14),
                    SizedBox(width: 4),
                    Text("Verified Professional", style: TextStyle(fontSize: 11, color: Color(0xFF1E60FF))),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildCircularAction(Icons.call, "Call"),
              const SizedBox(width: 12),
              _buildCircularAction(Icons.chat_bubble_outline, "Chat"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF1F1F1)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Icon(icon, color: const Color(0xFF1E60FF), size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF6A6A6A), fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildServiceDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.chat_outlined, color: Color(0xFF1E60FF), size: 20),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "Water leakage from kitchen tap. Continuous dripping even after closing. Needs immediate fix.",
                  style: TextStyle(fontSize: 14, color: Color(0xFF6A6A6A), height: 1.5),
                ),
              ),
            ],
          ),
          const Divider(height: 32, color: Color(0xFFF1F1F1)),
          InkWell(
            onTap: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.image_outlined, color: Color(0xFF1E60FF), size: 20),
                    SizedBox(width: 8),
                    Text(
                      "3 Photos Attached",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E60FF)),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: Color(0xFF6A6A6A), size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Column(
        children: [
          _buildBillRow("Service Charge", "₹300"),
          const SizedBox(height: 12),
          _buildBillRow("Material Cost", "₹0"),
          const SizedBox(height: 12),
          _buildBillRow("Platform Fee", "₹50", hasInfo: true),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(height: 1, color: Color(0xFFF1F1F1)),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1A1D1E)),
              ),
              Text(
                "₹350",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1E60FF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, {bool hasInfo = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(color: Color(0xFF6A6A6A), fontSize: 14)),
            if (hasInfo) ...[
              const SizedBox(width: 4),
              const Icon(Icons.info_outline, size: 14, color: Color(0xFF6A6A6A)),
            ]
          ],
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1A1D1E))),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6A6A6A),
                side: const BorderSide(color: Color(0xFFE0E0E0)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.highlight_off, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Cancel Request",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E60FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Contact Professional",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
