import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skill_link/utils/curved_background.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/widgets/custom_button.dart';
import '../../res/components/widgets/gradient_dropdown.dart';
import '../../utils/top_action_bar.dart';
import '../../view_models/controller/booking_controller.dart';

class BookingScreen extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final BookingController controller = Get.put(BookingController());

  BookingScreen({super.key, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP BAR
                TopActionBar(
                  leftIcon: Icons.arrow_back,
                  rightIcon: Icons.notifications_none_rounded,
                  showNotificationDot: true,
                  onRightTap: () => Get.toNamed('/notifications'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () => Get.back(),
                //       child: Container(
                //         width: 46,
                //         height: 46,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           color: AppColor.white,
                //         ),
                //         child: const Center(
                //           child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: onNotificationTap,
                //       child: Container(
                //         width: 46,
                //         height: 46,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           color: AppColor.white,
                //         ),
                //         child: Stack(
                //           alignment: Alignment.center,
                //           children: [
                //             Icon(Icons.notifications_none_rounded,
                //                 color: AppColor.blackColor, size: 28),
                //             Positioned(
                //               right: 12,
                //               top: 12,
                //               child: Container(
                //                 width: 10,
                //                 height: 10,
                //                 decoration: BoxDecoration(
                //                   color: AppColor.red,
                //                   borderRadius: BorderRadius.circular(50),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 24),

                /// HEADING
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB64D),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Book SkillLink's Professionals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// SERVICE TYPE DROPDOWN
                const Text(
                  "Select Service Type",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Obx(() => GradientDropdown<String>(
                  hintText: "Select Service Type",
                  items: ["Plumbing", "Electrical", "Carpentry", "Cleaning"],
                  value: controller.selectedService.value,
                  onChanged: (value) {
                    controller.selectedService.value = value!;
                  },
                )),
                const SizedBox(height: 16),

                /// SUB CATEGORY
                const Text(
                  "Select Sub-category",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Obx(() => GradientDropdown<String>(
                  hintText: "Select Sub-category",
                  items: [
                    "Fan Repair",
                    "Pipe Leakage",
                    "Door Repair",
                    "Switch-board Repair"
                  ],
                  value: controller.selectedSubCategory.value,
                  onChanged: (value) {
                    controller.selectedSubCategory.value = value!;
                  },
                )),
                const SizedBox(height: 16),

                /// SERVICE URGENCY
                const Text(
                  "Service Urgency",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  final urgencies = [
                    "Normal (24 hrs)",
                    "Urgent (4 hrs)",
                    "Schedule Later",
                  ];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: urgencies.map((type) {
                      final isSelected = controller.selectedUrgency.value == type;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () => controller.selectUrgency(type),
                            child: Container(
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFFFA726)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFFFA726)
                                      : Colors.grey.shade400,
                                  width: 1.2,
                                ),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color:
                                  isSelected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),

                /// DATE PICKER (when Schedule Later selected)
                Obx(() {
                  if (controller.selectedUrgency.value != "Schedule Later") {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () async {
                        final now = DateTime.now();
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: now,
                          lastDate: DateTime(now.year + 1),
                        );
                        if (pickedDate != null) {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            final dateTime = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                            controller.scheduledDate.value = dateTime;
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                          Border.all(color: Colors.orange.shade300, width: 1.2),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Text(
                              controller.scheduledDate.value == null
                                  ? "Select Date & Time"
                                  : DateFormat('dd MMM yyyy, hh:mm a')
                                  .format(controller.scheduledDate.value!),
                              style: const TextStyle(fontSize: 14),
                            )),
                            const Icon(Icons.calendar_today_outlined,
                                color: Color(0xFFFFA726)),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 18),

                /// PROBLEM DESCRIPTION
                const Text(
                  "Problem Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.problemTextController,
                  minLines: 4,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Describe your issue clearly...",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.orange.shade300),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Color(0xFFFFA726), width: 1.8),
                    ),
                  ),
                  style: const TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 18),

                /// IMAGE UPLOAD SECTION
                const Text(
                  "Attach Image (optional)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final picked = await picker.pickImage(
                        source: ImageSource.gallery, imageQuality: 70);
                    if (picked != null) {
                      controller.selectedImage.value = File(picked.path);
                    }
                  },
                  child: Obx(() {
                    final image = controller.selectedImage.value;
                    return Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.orange.shade300, width: 1.4),
                        color: const Color(0xFFFFF9F1),
                      ),
                      child: image == null
                          ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo_outlined,
                                color: Color(0xFFFFA726), size: 30),
                            SizedBox(height: 6),
                            Text("Upload Image",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13)),
                          ],
                        ),
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(image, fit: BoxFit.cover),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Clear",
                        color: Colors.grey.shade400,
                        onPressed: () {
                          // Clear your fields here
                          controller.clearForm();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        text: "Book Service",
                        color: const Color(0xFFFFB64D),
                        onPressed: () {
                          // Your booking logic here
                          controller.bookService();
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skill_link/utils/curved_background.dart';
//
// import '../../res/colors/app_color.dart';
// import '../../res/components/widgets/gradient_dropdown.dart';
// import '../../utils/gradient_textfield.dart';
// import '../../view_models/controller/booking_controller.dart';
//
// class BookingScreen extends StatelessWidget {
//   String? selectedValue;
//   final VoidCallback? onNotificationTap;
//
//   final BookingController controller = Get.put(BookingController());
//
//   BookingScreen({super.key, this.onNotificationTap});
//
//   @override
//   Widget build(BuildContext context) {
//     String? selectedValue;
//     return Scaffold(
//       body: CurvedBackground(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () => Get.back(),
//                         child: Container(
//                           width: 46,
//                           height: 46,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               12,
//                             ), // Rounded square
//                             color: AppColor.white,
//                           ),
//                           child: const Center(
//                             child: Icon(
//                               Icons.arrow_back,
//                               size: 20, // Optional: fine-tune icon size
//                               color:
//                                   Colors
//                                       .black, // or AppColor.blackColor if you prefer
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       GestureDetector(
//                         onTap: onNotificationTap,
//                         child: Container(
//                           width: 46,
//                           height: 46,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: AppColor.white,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Icon(
//                                 Icons.notifications_none_rounded,
//                                 color: AppColor.blackColor,
//                                 size: 28,
//                               ),
//                               Positioned(
//                                 right: 12,
//                                 top: 12,
//                                 child: Container(
//                                   width: 10,
//                                   height: 10,
//                                   decoration: BoxDecoration(
//                                     color: AppColor.red,
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 24),
//
//                   Container(
//                     width: double.infinity,
//                     height: 70,
//                     // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                     decoration: BoxDecoration(
//                       // gradient: const LinearGradient(
//                       //   colors: [Color(0xFFFFD580), Color(0xFFFFA726)], // soft orange gradient
//                       //   begin: Alignment.topLeft,
//                       //   end: Alignment.bottomRight,
//                       // ),
//                       color: Color(0xFFFFB64D),
//                       borderRadius: BorderRadius.circular(18),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.orangeAccent.withOpacity(0.3),
//                           blurRadius: 8,
//                           offset: const Offset(2, 4),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Book SkillLink's Professionals",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                           letterSpacing: 0.5,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 24),
//                   Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Select Service type",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 10),
//
//                       GradientDropdown<String>(
//                         hintText: "Select Service Type",
//                         items: [
//                           "Plumbing",
//                           "Electrical",
//                           "Carpentry",
//                           "Cleaning",
//                         ],
//                         value: selectedValue,
//                         onChanged: (value) {
//                           selectedValue = value;
//                         },
//                         // prefixIcon: Icons.home_repair_service_outlined,
//                       ),
//                       SizedBox(height: 10),
//
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Select sub-category",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       GradientDropdown<String>(
//                         hintText: "Select Sub-category",
//                         items: [
//                           "Fan Repair",
//                           "Pipe Leakage",
//                           "Door Repair",
//                           "Switch-board Repair",
//                         ],
//                         value: selectedValue,
//                         onChanged: (value) {
//                           selectedValue = value;
//                         },
//                         // prefixIcon: Icons.home_repair_service_outlined,
//                       ),
//                       SizedBox(height: 10),
//
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Service Urgency",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 10),
//
//                       Obx(() {
//                         final urgencies = [
//                           "Normal (24 hrs)",
//                           "Urgent (4 hrs)",
//                           "Schedule Later",
//                         ];
//                         return Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children:
//                               urgencies.map((type) {
//                                 final isSelected =
//                                     controller.selectedUrgency.value == type;
//                                 return Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 4,
//                                     ),
//                                     child: GestureDetector(
//                                       onTap:
//                                           () => controller.selectUrgency(type),
//                                       child: Container(
//                                         height: 48,
//                                         alignment: Alignment.center,
//                                         decoration: BoxDecoration(
//                                           color:
//                                               isSelected
//                                                   ? Color(0xFFFFA726)
//                                                   : Colors.white,
//                                           borderRadius: BorderRadius.circular(
//                                             12,
//                                           ),
//                                           border: Border.all(
//                                             color:
//                                                 isSelected
//                                                     ? Color(0xFFFFA726)
//                                                     : Colors.grey.shade400,
//                                             width: 1.2,
//                                           ),
//                                         ),
//                                         child: Text(
//                                           type,
//                                           style: TextStyle(
//                                             color:
//                                                 isSelected
//                                                     ? Colors.white
//                                                     : Colors.black87,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 13,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                         );
//                       }),
//
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Problem description",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 10),
//
//                       TextField(
//                         minLines: 4,
//                         maxLines: 6,
//                         keyboardType: TextInputType.multiline,
//                         decoration: InputDecoration(
//                           hintText: "Describe your issue clearly...",
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: const EdgeInsets.all(16),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: Colors.orange.shade300,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: Color(0xFFFFA726),
//                               width: 1.8,
//                             ),
//                           ),
//                         ),
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
