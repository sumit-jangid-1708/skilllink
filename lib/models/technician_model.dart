import 'category_model.dart';
import 'review_model.dart';

class TechnicianModel {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String city;
  final List<CategoryModel> skillCategories;
  final int experienceYears;
  final String avgRating;
  final int totalReviews;
  final int completionRate;
  final bool isAvailable;
  final String verificationStatus;
  final String? profilePhoto;
  final List<ReviewModel> reviews;

  TechnicianModel({required this.id, required this.fullName, required this.phoneNumber, required this.city, required this.skillCategories, required this.experienceYears, required this.avgRating, required this.totalReviews, required this.completionRate, required this.isAvailable, required this.verificationStatus, required this.profilePhoto, required this.reviews});

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      city: json['city'] ?? '',
      skillCategories: (json['skill_categories'] as List? ?? []).map((item) => CategoryModel.fromJson(item)).toList(),
      experienceYears: json['experience_years'] ?? 0,
      avgRating: json['avg_rating']?.toString() ?? '0',
      totalReviews: json['total_reviews'] ?? 0,
      completionRate: json['completion_rate'] ?? 0,
      isAvailable: json['is_available'] ?? false,
      verificationStatus: json['verification_status'] ?? '',
      profilePhoto: json['profile_photo'],
      reviews: (json['reviews'] as List? ?? []).map((item) => ReviewModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'phone_number': phoneNumber,
    'city': city,
    'skill_categories': skillCategories.map((item) => item.toJson()).toList(),
    'experience_years': experienceYears,
    'avg_rating': avgRating,
    'total_reviews': totalReviews,
    'completion_rate': completionRate,
    'is_available': isAvailable,
    'verification_status': verificationStatus,
    'profile_photo': profilePhoto,
    'reviews': reviews.map((item) => item.toJson()).toList(),
  };
}
