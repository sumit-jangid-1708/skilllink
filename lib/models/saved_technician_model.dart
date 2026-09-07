import 'technician_model.dart';

class SavedTechnicianModel {
  final int id;
  final TechnicianModel technician;
  final String createdAt;

  SavedTechnicianModel({required this.id, required this.technician, required this.createdAt});

  factory SavedTechnicianModel.fromJson(Map<String, dynamic> json) {
    return SavedTechnicianModel(
      id: json['id'] ?? 0,
      technician: TechnicianModel.fromJson(json['technician']),
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'technician': technician.toJson(),
    'created_at': createdAt,
  };
}
