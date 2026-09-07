import 'customer_profile_model.dart';

class ProfileModel {
  final int id;
  final String phoneNumber;
  final String role;
  final bool isActive;
  final String createdAt;
  final CustomerProfileModel? profile;

  ProfileModel({required this.id, required this.phoneNumber, required this.role, required this.isActive, required this.createdAt, required this.profile});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] ?? '',
      profile: json['profile'] == null ? null : CustomerProfileModel.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'phone_number': phoneNumber,
    'role': role,
    'is_active': isActive,
    'created_at': createdAt,
    'profile': profile?.toJson(),
  };
}
