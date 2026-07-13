import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/res/components/widgets/custom_profile_dropdown.dart';
import 'package:skill_link/res/components/widgets/custom_profile_text_field.dart';
import 'package:skill_link/view_models/controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfilePhotoSection(),
                      const SizedBox(height: 25),
                      
                      const Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      Row(
                        children: [
                          Expanded(
                            child: CustomProfileTextField(
                              label: "Full Name",
                              hintText: "Rahul Kumar",
                              controller: controller.nameController.value,
                              prefixIcon: Icons.person_outline,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomProfileTextField(
                              label: "Phone Number",
                              hintText: "+91 98765 43210",
                              controller: controller.phoneController.value,
                              prefixIcon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      
                      CustomProfileTextField(
                        label: "Email Address",
                        hintText: "rahul.kumar@email.com",
                        controller: controller.emailController.value,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      
                      Obx(() => CustomProfileTextField(
                        label: "Date of Birth",
                        hintText: controller.dob.value,
                        prefixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: () {
                          // Date picker logic
                        },
                      )),
                      const SizedBox(height: 12),
                      
                      Obx(() => CustomProfileDropdown<String>(
                        label: "Gender",
                        hintText: "Select Gender",
                        value: controller.gender.value,
                        items: const ["Male", "Female", "Other"],
                        prefixIcon: Icons.person_outline,
                        onChanged: controller.updateGender,
                      )),
                      
                      const SizedBox(height: 25),
                      
                      const Text(
                        "Address Information",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      CustomProfileTextField(
                        label: "Address",
                        hintText: "Koramangala, Bengaluru",
                        controller: controller.addressController.value,
                        prefixIcon: Icons.location_on_outlined,
                      ),
                      const SizedBox(height: 12),
                      
                      CustomProfileTextField(
                        label: "City",
                        hintText: "Bengaluru",
                        controller: controller.cityController.value,
                        prefixIcon: Icons.location_city_outlined,
                      ),
                      const SizedBox(height: 12),
                      
                      Row(
                        children: [
                          Expanded(
                            child: Obx(() => CustomProfileDropdown<String>(
                              label: "State",
                              hintText: "Select State",
                              value: controller.state.value,
                              items: const ["Karnataka", "Maharashtra", "Delhi", "UP"],
                              prefixIcon: Icons.map_outlined,
                              onChanged: controller.updateState,
                            )),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomProfileTextField(
                              label: "PIN Code",
                              hintText: "560034",
                              controller: controller.pinCodeController.value,
                              prefixIcon: Icons.tag,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: AppColor.white, size: 20),
            ),
          ),
          const SizedBox(width: 5),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Update your personal information",
                  style: TextStyle(
                    color: AppColor.accent,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () => controller.saveProfile(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              ),
              child: const Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePhotoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.grey100),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.grey100,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: "https://ui-avatars.com/api/?name=Rahul+Kumar&background=4C86FF&color=fff",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.white, width: 2),
                  ),
                  child: const Icon(Icons.camera_alt, color: AppColor.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile Photo",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textPrimary,
                  ),
                ),
                const Text(
                  "JPG, PNG or GIF. Max size of 5MB.",
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColor.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera_outlined, size: 16),
                      label: const Text("Change Photo", style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColor.primary,
                        side: const BorderSide(color: AppColor.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Remove",
                        style: TextStyle(color: AppColor.red, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
