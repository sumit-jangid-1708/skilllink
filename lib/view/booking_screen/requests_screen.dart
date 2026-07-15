import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/components/widgets/request_card.dart';
import 'package:skill_link/res/routes/routes_names.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        children: [
          // ── STACKED HEADER & FLOATING FILTER TABS ──
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colorScheme.primary, colorScheme.primary.withBlue(255)],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Requests",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Track and manage your service requests",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        shape: const CircleBorder(),
                        minimumSize: const Size(48, 48),
                      ),
                    ),
                  ],
                ),
              ),

              // Floating Filter Container
              Positioned(
                bottom: -28,
                left: 16,
                right: 16,
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
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

          const SizedBox(height: 40),

          // ── REQUEST LIST ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                  onTap: () {
                    Get.toNamed(RouteName.requestDetailsScreen);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isActive = selectedFilter == label;
    
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedFilter = label),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isActive ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
