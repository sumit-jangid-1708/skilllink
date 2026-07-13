import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/request_card.dart';

import '../../res/routes/routes_names.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> requests = [
    {
      "title": "Kitchen Tap Leakage",
      "category": "Plumbing",
      "location": "Koramangala, Bengaluru",
      "date": "12 May 2024",
      "time": "10:00 AM",
      "price": "350",
      "status": RequestStatus.pending,
      "icon": Icons.plumbing_rounded,
    },
    {
      "title": "Switch Board Repair",
      "category": "Electrical",
      "location": "Koramangala, Bengaluru",
      "date": "11 May 2024",
      "time": "02:30 PM",
      "price": "250",
      "status": RequestStatus.accepted,
      "icon": Icons.bolt_rounded,
    },
    {
      "title": "AC Service",
      "category": "AC Repair",
      "location": "Koramangala, Bengaluru",
      "date": "09 May 2024",
      "time": "11:00 AM",
      "price": "650",
      "status": RequestStatus.completed,
      "icon": Icons.ac_unit_rounded,
    },
    {
      "title": "Wall Painting",
      "category": "Painting",
      "location": "Indiranagar, Bengaluru",
      "date": "05 May 2024",
      "time": "09:00 AM",
      "price": "1,200",
      "status": RequestStatus.completed,
      "icon": Icons.format_paint_rounded,
    },
    {
      "title": "Door Repair",
      "category": "Carpentry",
      "location": "Koramangala, Bengaluru",
      "date": "02 May 2024",
      "time": "04:00 PM",
      "price": "400",
      "status": RequestStatus.cancelled,
      "icon": Icons.handyman_rounded,
    },
  ];

  List<Map<String, dynamic>> get filteredRequests {
    if (selectedFilter == "All") return requests;
    return requests.where((r) {
      switch (selectedFilter) {
        case "Pending":
          return r['status'] == RequestStatus.pending;
        case "Accepted":
          return r['status'] == RequestStatus.accepted;
        case "Completed":
          return r['status'] == RequestStatus.completed;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Precise off-white background
      body: Column(
        children: [
          // ── STACKED HEADER & FLOATING FILTER TABS ──
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2F80ED), Color(0xFF0056C6)],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Requests",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Track and manage your service requests",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Funnel Filter Icon from Mockup
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),

              // Floating Filter Container positioned at the bottom edge
              Positioned(
                bottom: -24,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: ["All", "Pending", "Accepted", "Completed"]
                        .map((label) => _buildFilterTab(label))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),

          // Spacer corresponding to the overlay overlap height
          const SizedBox(height: 32),

          // ── REQUEST LIST ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                final item = filteredRequests[index];
                return RequestCard(
                  title: item['title'],
                  category: item['category'],
                  location: item['location'],
                  date: item['date'],
                  time: item['time'],
                  price: item['price'],
                  status: item['status'],
                  categoryIcon: item['icon'],
                  onTap: () {Get.toNamed(RouteName.requestDetailsScreen);},
                );
              },
            ),
          ),

          // // ── NEED HELP BANNER ──
          // Container(
          //   margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //   decoration: BoxDecoration(
          //     color: const Color(0xFFF0F5FF),
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 44,
          //         height: 44,
          //         decoration: const BoxDecoration(
          //           color: Color(0xFF2F80ED),
          //           shape: BoxShape.circle,
          //         ),
          //         child: const Icon(Icons.headset_mic_rounded,
          //             color: Colors.white, size: 20),
          //       ),
          //       const SizedBox(width: 12),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             Text(
          //               "Need Help?",
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w700,
          //                 color: Color(0xFF1A1A1A),
          //               ),
          //             ),
          //             SizedBox(height: 2),
          //             Text(
          //               "Our support team is here to assist you.",
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: Color(0xFF707070),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(width: 8),
          //       OutlinedButton(
          //         onPressed: () {},
          //         style: OutlinedButton.styleFrom(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 14, vertical: 10),
          //           side: const BorderSide(color: Color(0xFFDCE4F2), width: 1),
          //           backgroundColor: Colors.white,
          //           elevation: 0,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //         ),
          //         child: const Text(
          //           "Contact Support",
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Color(0xFF2F80ED),
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Mimics system bottom navigation bar area padding
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isActive = selectedFilter == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedFilter = label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2F80ED) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF707070),
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}