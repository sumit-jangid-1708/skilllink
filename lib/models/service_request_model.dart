import 'timeline_model.dart';

class ServiceRequestModel {
  final int id;
  final String requestId;
  final int? skillCategory;
  final String skillCategoryName;
  final int? technician;
  final String technicianName;
  final String subCategory;
  final String urgency;
  final String description;
  final String address;
  final String city;
  final String status;
  final String? image;
  final String? photoBefore;
  final String? photoAfter;
  final String? scheduledAt;
  final String? completedAt;
  final String? amount;
  final bool isPaid;
  final String createdAt;
  final List<TimelineModel> timeline;

  ServiceRequestModel({required this.id, required this.requestId, required this.skillCategory, required this.skillCategoryName, required this.technician, required this.technicianName, required this.subCategory, required this.urgency, required this.description, required this.address, required this.city, required this.status, required this.image, required this.photoBefore, required this.photoAfter, required this.scheduledAt, required this.completedAt, required this.amount, required this.isPaid, required this.createdAt, required this.timeline});

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) {
    return ServiceRequestModel(
      id: json['id'] ?? 0,
      requestId: json['request_id'] ?? '',
      skillCategory: json['skill_category'],
      skillCategoryName: json['skill_category_name'] ?? '',
      technician: json['technician'],
      technicianName: json['technician_name'] ?? '',
      subCategory: json['sub_category'] ?? '',
      urgency: json['urgency'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      status: json['status'] ?? '',
      image: json['image'],
      photoBefore: json['photo_before'],
      photoAfter: json['photo_after'],
      scheduledAt: json['scheduled_at'],
      completedAt: json['completed_at'],
      amount: json['amount']?.toString(),
      isPaid: json['is_paid'] ?? false,
      createdAt: json['created_at'] ?? '',
      timeline: (json['timeline'] as List? ?? []).map((item) => TimelineModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'request_id': requestId,
    'skill_category': skillCategory,
    'skill_category_name': skillCategoryName,
    'technician': technician,
    'technician_name': technicianName,
    'sub_category': subCategory,
    'urgency': urgency,
    'description': description,
    'address': address,
    'city': city,
    'status': status,
    'image': image,
    'photo_before': photoBefore,
    'photo_after': photoAfter,
    'scheduled_at': scheduledAt,
    'completed_at': completedAt,
    'amount': amount,
    'is_paid': isPaid,
    'created_at': createdAt,
    'timeline': timeline.map((item) => item.toJson()).toList(),
  };
}
