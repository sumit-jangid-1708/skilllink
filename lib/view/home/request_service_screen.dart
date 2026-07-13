import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/custom_button.dart';
import 'package:skill_link/view_models/controller/request_service_controller.dart';

class RequestServiceScreen extends StatelessWidget {
  RequestServiceScreen({super.key});

  final controller = Get.put(RequestServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          // 1. Blue Background Gradient (Background Layer)
          Container(
            height: 280, 
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4C86FF), Color(0xFF2E6FF2)],
              ),
            ),
          ),
          
          // 2. Foreground content layer
          Column(
            children: [
              // Header UI (Transparent background, sits over blue)
              _buildHeaderContent(),
              
              // White Body Section with Top Curves (Overlapping the blue)
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle("1. Select Category"),
                          const SizedBox(height: 15),
                          _buildCategoryList(),
                          const SizedBox(height: 12),
                          _buildDotsIndicator(),
                          const SizedBox(height: 30),
                          
                          _buildSectionTitle("2. Describe Your Issue"),
                          const SizedBox(height: 15),
                          _buildDescriptionBox(),
                          const SizedBox(height: 30),
                          
                          _buildSectionTitleWithSubtitle("3. Add Photos", "(Optional)"),
                          const Text(
                            "Add images to help professionals understand the issue better",
                            style: TextStyle(color: AppColor.textSecondary, fontSize: 12),
                          ),
                          const SizedBox(height: 15),
                          _buildPhotoList(),
                          const SizedBox(height: 30),
                          
                          _buildSectionTitle("4. Select Date & Time"),
                          const SizedBox(height: 15),
                          _buildDateTimeSelectors(context),
                          const SizedBox(height: 30),
                          
                          _buildSectionTitle("5. Your Location"),
                          const SizedBox(height: 15),
                          _buildLocationCard(),
                          const SizedBox(height: 40),
                          
                          CustomButton(
                            text: "Continue",
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                            iconPosition: IconPosition.right,
                          ),
                          const SizedBox(height: 20),
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

  Widget _buildHeaderContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 35),
      child: Row(
        children: [
          _buildCircleIconButton(Icons.arrow_back, () => Get.back()),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Request Service",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tell us what you need",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildSupportButton(),
        ],
      ),
    );
  }

  Widget _buildCircleIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildSupportButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.headset_mic, color: Colors.white, size: 18),
          SizedBox(height: 4),
          Text(
            "Support",
            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColor.textPrimary,
      ),
    );
  }

  Widget _buildSectionTitleWithSubtitle(String title, String subtitle) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColor.textPrimary,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
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
              child: Container(
                width: 82,
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isSelected ? AppColor.primary : AppColor.grey200,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(color: AppColor.primary.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))
                  ] : [],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          category['icon'] as IconData,
                          color: isSelected ? AppColor.primary : AppColor.textPrimary.withOpacity(0.7),
                          size: 32,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category['name'] as String,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? AppColor.primary : AppColor.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    if (isSelected)
                      Positioned(
                        top: -24,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppColor.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.white, size: 10),
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

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: index == 0 ? 12 : 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: index == 0 ? AppColor.primary : AppColor.grey200,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  Widget _buildDescriptionBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: controller.issueController,
            maxLines: 4,
            style: const TextStyle(fontSize: 14, color: AppColor.textPrimary),
            decoration: const InputDecoration(
              hintText: "Explain your issue in detail...",
              hintStyle: TextStyle(color: AppColor.textHint, fontSize: 14),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
            "${controller.charCount.value}/250",
            style: const TextStyle(color: AppColor.textHint, fontSize: 11, fontWeight: FontWeight.w500),
          )),
        ],
      ),
    );
  }

  Widget _buildPhotoList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildUploadButton(),
          ...List.generate(3, (index) => _buildEmptyPhotoSlot()),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return InkWell(
      onTap: () => controller.pickImages(),
      child: Container(
        width: 85,
        height: 85,
        margin: const EdgeInsets.only(right: 15),
        child: CustomPaint(
          painter: DashedRectPainter(color: AppColor.primary.withOpacity(0.4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.camera_alt_outlined, color: AppColor.primary, size: 22),
              SizedBox(height: 6),
              Text(
                "Upload Photos",
                style: TextStyle(color: AppColor.primary, fontSize: 8, fontWeight: FontWeight.bold),
              ),
              Text(
                "Tap to upload",
                style: TextStyle(color: AppColor.textHint, fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyPhotoSlot() {
    return Container(
      width: 85,
      height: 85,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.grey100),
      ),
      child: Icon(Icons.image_outlined, color: AppColor.grey400, size: 28),
    );
  }

  Widget _buildDateTimeSelectors(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSelectorTile(
            icon: Icons.calendar_today_outlined,
            label: "Select Date",
            onTap: () => controller.selectDate(context),
            value: controller.selectedDate,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _buildSelectorTile(
            icon: Icons.access_time_outlined,
            label: "Select Time",
            onTap: () => controller.selectTime(context),
            value: controller.selectedTime,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectorTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required dynamic value,
  }) {
    return Obx(() {
      String displayValue = label;
      if (value.value != null) {
        if (value.value is DateTime) {
          displayValue = "${value.value.day}/${value.value.month}/${value.value.year}";
        } else if (value.value is TimeOfDay) {
          displayValue = value.value.format(Get.context!);
        }
      }
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.grey200),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColor.textSecondary, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  displayValue,
                  style: TextStyle(
                    color: value.value != null ? AppColor.textPrimary : AppColor.textHint,
                    fontSize: 13,
                    fontWeight: value.value != null ? FontWeight.w600 : FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: AppColor.textHint, size: 18),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.grey200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on_outlined, color: AppColor.textSecondary, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  controller.location.value,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppColor.textPrimary),
                )),
                const SizedBox(height: 4),
                const Text(
                  "We'll match you with professionals near you",
                  style: TextStyle(color: AppColor.textHint, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(50, 30)),
            child: const Text(
              "Change",
              style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({this.color = Colors.black, this.strokeWidth = 1.0, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(15)));

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
