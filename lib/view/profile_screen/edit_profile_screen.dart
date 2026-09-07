import 'package:skill_link/res/app_url/app_url.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_link/res/components/widgets/custom_profile_dropdown.dart';
import 'package:skill_link/res/components/widgets/custom_profile_text_field.dart';
import 'package:skill_link/view_models/controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias, // Fix: Clips scrolling content inside rounded corners
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      _buildProfilePhotoSection(context),
                      const SizedBox(height: 32),
                      
                      Text(
                        "Personal Information",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      CustomProfileTextField(
                        label: "Full Name",
                        hintText: "Rahul Kumar",
                        controller: controller.nameController.value,
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 12),
                      
                      CustomProfileTextField(
                        label: "Phone Number",
                        hintText: "+91 98765 43210",
                        controller: controller.phoneController.value,
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
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
                        onTap: () {},
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
                      
                      const SizedBox(height: 32),
                      
                      Text(
                        "Address Information",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
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
                      const SizedBox(height: 40),
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

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
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
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Profile",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Update your personal details",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => FilledButton(
            onPressed: controller.isLoading.value ? null : () => controller.saveProfile(),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              minimumSize: const Size(0, 44),
            ),
            child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ],
      ),
    );
  }

  Widget _buildProfilePhotoSection(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primaryContainer.withOpacity(0.5),
                  border: Border.all(color: colorScheme.surface, width: 4),
                ),
                child: ClipOval(
                  child: Obx(() => controller.selectedPhoto != null
                    ? Image.file(File(controller.profileImage.value), fit: BoxFit.cover)
                    : CachedNetworkImage(
                    imageUrl: AppUrl.mediaUrl(controller.profileImage.value),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      size: 40,
                      color: colorScheme.primary,
                    ),
                  )),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 2),
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Photo",
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "JPG or PNG. Max size 5MB.",
                  style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: controller.changePhoto,
                      icon: const Icon(Icons.photo_library_outlined, size: 18),
                      label: const Text("Change"),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: controller.removeProfilePhoto,
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.error,
                      ),
                      child: const Text("Remove"),
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
