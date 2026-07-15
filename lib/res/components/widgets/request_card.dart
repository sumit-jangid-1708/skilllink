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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Category Icon Container ──
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(categoryIcon, color: colorScheme.primary, size: 28),
            ),

            const SizedBox(width: 16),

            // ── Middle Meta Text details ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    category,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Location Row
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded,
                          size: 14, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          location,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
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
                      Icon(Icons.calendar_month_rounded,
                          size: 14, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        "$date  •  $time",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // ── Right Component Content Layout ──
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildStatusBadge(context, status),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "₹$price",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.chevron_right_rounded,
                        color: colorScheme.onSurfaceVariant, size: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, RequestStatus status) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    Color bgColor;
    Color textColor;
    String label;

    switch (status) {
      case RequestStatus.pending:
        bgColor = Colors.orange.withOpacity(0.1);
        textColor = Colors.orange.shade800;
        label = "Pending";
        break;
      case RequestStatus.accepted:
        bgColor = colorScheme.primaryContainer;
        textColor = colorScheme.onPrimaryContainer;
        label = "Accepted";
        break;
      case RequestStatus.completed:
        bgColor = Colors.green.withOpacity(0.1);
        textColor = Colors.green.shade800;
        label = "Completed";
        break;
      case RequestStatus.cancelled:
        bgColor = colorScheme.errorContainer;
        textColor = colorScheme.onErrorContainer;
        label = "Cancelled";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
