import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/components/widgets/profile_option_tile.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Overlapping Profile Card
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Blue Gradient Header
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primary,
                        colorScheme.primary.withBlue(255),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings_outlined, color: Colors.white),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.15),
                              minimumSize: const Size(48, 48),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Manage your account and preferences",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                // Overlapping Profile Card
                Positioned(
                  bottom: -60,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 84,
                              width: 84,
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer.withOpacity(0.5),
                                shape: BoxShape.circle,
                                border: Border.all(color: colorScheme.surface, width: 4),
                              ),
                              child: Icon(Icons.person_rounded, size: 48, color: colorScheme.primary),
                            ),
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: colorScheme.primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: colorScheme.surface, width: 2),
                                ),
                                child: const Icon(Icons.camera_alt_rounded, size: 12, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rahul Kumar",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.phone_outlined, size: 16, color: colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    "+91 98765 43210",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 84),

            // Sections
            _buildSectionHeader(context, "ACCOUNT"),
            _buildSectionCard(context, [
              ProfileOptionTile(
                title: "Edit Profile",
                icon: Icons.edit_outlined,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: colorScheme.primary,
                onTap: () => Get.toNamed(RouteName.editProfileScreen),
              ),
              Divider(height: 1, indent: 64, color: colorScheme.outlineVariant.withOpacity(0.5)),
              ProfileOptionTile(
                title: "My Requests",
                icon: Icons.assignment_outlined,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: colorScheme.primary,
                onTap: () {},
              ),
              Divider(height: 1, indent: 64, color: colorScheme.outlineVariant.withOpacity(0.5)),
              ProfileOptionTile(
                title: "Saved Workers",
                icon: Icons.favorite_rounded,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: Colors.pink,
                onTap: () {},
              ),
            ]),

            _buildSectionHeader(context, "SUPPORT"),
            _buildSectionCard(context, [
              ProfileOptionTile(
                title: "Help & Support",
                icon: Icons.headset_mic_outlined,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: colorScheme.primary,
                onTap: () {},
              ),
              Divider(height: 1, indent: 64, color: colorScheme.outlineVariant.withOpacity(0.5)),
              ProfileOptionTile(
                title: "Rate the App",
                icon: Icons.star_outline_rounded,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: Colors.amber,
                onTap: () {},
              ),
              Divider(height: 1, indent: 64, color: colorScheme.outlineVariant.withOpacity(0.5)),
              ProfileOptionTile(
                title: "Privacy Policy",
                icon: Icons.article_outlined,
                iconBgColor: colorScheme.primaryContainer,
                iconColor: Colors.teal,
                onTap: () {},
              ),
            ]),

            _buildSectionHeader(context, "SESSION"),
            _buildSectionCard(context, [
              ProfileOptionTile(
                title: "Logout",
                icon: Icons.logout_rounded,
                iconBgColor: colorScheme.errorContainer,
                iconColor: colorScheme.error,
                isDestructive: true,
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 32),
            Text(
              "SkillLink v1.0.0 • Made with ❤️",
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                letterSpacing: 1.5,
              ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5)),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
