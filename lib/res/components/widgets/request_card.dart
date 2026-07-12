import 'package:flutter/material.dart';

enum RequestStatus { pending, accepted, completed, cancelled }

class RequestCard extends StatelessWidget {
  final String title;
  final String category;
  final String location;
  final String date;
  final String time;
  final String price;
  final RequestStatus status;
  final IconData categoryIcon;
  final VoidCallback onTap;

  const RequestCard({
    super.key,
    required this.title,
    required this.category,
    required this.location,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
    required this.categoryIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF3F3F3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Category Icon Container ──
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F5FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(categoryIcon, color: const Color(0xFF2F80ED), size: 28),
            ),

            const SizedBox(width: 12),

            // ── Middle Meta Text details ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF888888),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Location Row
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded,
                          size: 13, color: Color(0xFF2F80ED)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                              fontSize: 11, color: Color(0xFF707070)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Date Row
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded,
                          size: 13, color: Color(0xFF2F80ED)),
                      const SizedBox(width: 4),
                      Text(
                        "$date  •  $time",
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFF707070)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // ── Right Component Content Layout (Dynamic Structure) ──
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildStatusBadge(status),
                const SizedBox(height: 20), // Controlled separation
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "₹$price",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2F80ED),
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Icons.chevron_right_rounded,
                        color: Color(0xFFBCBCBC), size: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(RequestStatus status) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status) {
      case RequestStatus.pending:
        bgColor = const Color(0xFFFFF4E6);
        textColor = const Color(0xFFFF9200);
        label = "Pending";
        break;
      case RequestStatus.accepted:
        bgColor = const Color(0xFFE6F0FF);
        textColor = const Color(0xFF2F80ED);
        label = "Accepted";
        break;
      case RequestStatus.completed:
        bgColor = const Color(0xFFE8F8EE);
        textColor = const Color(0xFF27AE60);
        label = "Completed";
        break;
      case RequestStatus.cancelled:
        bgColor = const Color(0xFFFFEBEB);
        textColor = const Color(0xFFEB5757);
        label = "Cancelled";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}