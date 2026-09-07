import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skill_link/res/components/widgets/custom_button.dart';
import 'package:skill_link/view_models/controller/request_service_controller.dart';

class RequestServiceScreen extends StatelessWidget {
  RequestServiceScreen({super.key});

  final controller = Get.put(RequestServiceController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colorScheme.primary, colorScheme.primary.withBlue(255)],
              ),
            ),
          ),
          Column(
            children: [
              _buildHeaderContent(context),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(context, "1. Select Category"),
                          const SizedBox(height: 16),
                          Obx(() => _buildCategoryList(context)),
                          const SizedBox(height: 16),
                          _buildDotsIndicator(context),
                          const SizedBox(height: 32),
                          
                          _buildSectionTitle(context, "2. Describe Your Issue"),
                          const SizedBox(height: 16),
                          _buildDescriptionBox(context),
                          const SizedBox(height: 32),
                          
                          _buildSectionTitleWithSubtitle(context, "3. Add Photos", "(Optional)"),
                          Text(
                            "Add images to help professionals understand the issue better",
                            style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 16),
                          _buildPhotoList(context),
                          const SizedBox(height: 32),
                          
                          _buildSectionTitle(context, "4. Select Date & Time"),
                          const SizedBox(height: 16),
                          _buildDateTimeSelectors(context),
                          const SizedBox(height: 32),
                          
                          _buildSectionTitle(context, "5. Your Location"),
                          const SizedBox(height: 16),
                          _buildLocationCard(context),
                          const SizedBox(height: 48),
                          
                          Obx(() => CustomButton(
                            text: controller.isLoading.value ? "Processing..." : "Continue",
                            onPressed: controller.createRequest,
                            isDisabled: controller.isLoading.value,
                            icon: controller.isLoading.value 
                                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                : const Icon(Icons.arrow_forward, size: 18),
                            iconPosition: IconPosition.right,
                          )),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + 16, 16, 32),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                  "Request Service",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tell us what you need",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          _buildSupportButton(context),
        ],
      ),
    );
  }

  Widget _buildSupportButton(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.headset_mic, color: Colors.white, size: 18),
          const SizedBox(height: 4),
          Text(
            "Support",
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildSectionTitleWithSubtitle(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(controller.categories.length, (index) {
          final category = controller.categories[index];
          return Obx(() {
            bool isSelected = controller.selectedCategoryIndex.value == index;
            return GestureDetector(
              onTap: () => controller.setCategory(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 88,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.primaryContainer.withOpacity(0.3) : colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(color: colorScheme.primary.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4))
                  ] : [],
                ),
                child: Column(
                  children: [
                    Icon(
                      category['icon'] as IconData,
                      color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category['name'] as String,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  Widget _buildDotsIndicator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: index == 0 ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == 0 ? colorScheme.primary : colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildDescriptionBox(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: controller.issueController,
            maxLines: 4,
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: "Explain your issue in detail...",
              hintStyle: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() => Text(
            "${controller.charCount.value}/250",
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildPhotoList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildUploadButton(context),
          Obx(() => Row(
            children: List.generate(controller.images.length, (index) => Container(
                  width: 96, height: 96,
                  margin: const EdgeInsets.only(right: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Image.file(File(controller.images[index]), fit: BoxFit.cover, width: 96, height: 96),
                      Position88(
                        top: 4, right: 4,
                        child: GestureDetector(
                          onTap: () => controller.images.removeAt(index),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                            child: const Icon(Icons.close, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          )),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => controller.pickImages(),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 96,
        height: 96,
        margin: const EdgeInsets.only(right: 16),
        child: CustomPaint(
          painter: DashedRectPainter(color: colorScheme.primary.withOpacity(0.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined, color: colorScheme.primary, size: 28),
              const SizedBox(height: 8),
              Text(
                "Upload",
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tap to add",
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeSelectors(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSelectorTile(
            context,
            icon: Icons.calendar_today_outlined,
            label: "Select Date",
            onTap: () => controller.selectDate(context),
            value: controller.selectedDate,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSelectorTile(
            context,
            icon: Icons.access_time_outlined,
            label: "Select Time",
            onTap: () => controller.selectTime(context),
            value: controller.selectedTime,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectorTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Rxn value,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Obx(() {
      String displayValue = label;
      bool hasValue = value.value != null;
      
      if (hasValue) {
        if (value.value is DateTime) {
          displayValue = DateFormat('dd MMM, yyyy').format(value.value);
        } else if (value.value is TimeOfDay) {
          displayValue = value.value.format(context);
        }
      }
      
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: hasValue ? colorScheme.primary.withOpacity(0.05) : colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hasValue ? colorScheme.primary : colorScheme.outlineVariant,
              width: hasValue ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: hasValue ? colorScheme.primary : colorScheme.onSurfaceVariant, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  displayValue,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: hasValue ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                    fontWeight: hasValue ? FontWeight.bold : FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: colorScheme.onSurfaceVariant, size: 20),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLocationCard(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.location_on_outlined, color: colorScheme.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  controller.location.value.isEmpty ? "Location not set" : controller.location.value,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 4),
                Text(
                  "Professionals near you will be matched",
                  style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(48, 48),
            ),
            child: Text(
              "Change",
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Position88 extends StatelessWidget {
  final double? top, right, bottom, left;
  final Widget child;
  const Position88({super.key, this.top, this.right, this.bottom, this.left, required this.child});
  @override
  Widget build(BuildContext context) => Positioned(top: top, right: right, bottom: bottom, left: left, child: child);
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({this.color = Colors.black, this.strokeWidth = 1.5, this.gap = 4.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(20)));

    Path dashPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
