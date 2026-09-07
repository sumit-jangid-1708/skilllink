import 'package:skill_link/res/app_url/app_url.dart';
import 'package:get/get.dart';
import 'package:skill_link/view_models/controller/star_controller.dart';
import 'package:skill_link/res/components/widgets/worker_card.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:flutter/material.dart';

class StarScreen extends StatelessWidget {
  const StarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StarController());
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Saved Workers",
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() => controller.saved.isNotEmpty
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: controller.saved.map((saved) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: WorkerCard(
                  name: saved.technician.fullName,
                  profession: saved.technician.skillCategories.map((item) => item.name).join(', '),
                  rating: saved.technician.avgRating,
                  distance: '—',
                  imageUrl: AppUrl.mediaUrl(saved.technician.profilePhoto),
                  onViewProfile: () => Get.toNamed(RouteName.workerProfileScreen, arguments: saved.technician.id),
                ),
              )).toList(),
            )
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_rounded,
                  size: 64,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "No Saved Workers",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Save your favorite professionals here for quick access in the future.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
                label: const Text("Explore Professionals"),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(200, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
