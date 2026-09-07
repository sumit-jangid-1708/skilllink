class CustomerProfileModel {
  final int id;
  final String fullName;
  final String? email;
  final String address;
  final String city;
  final String pincode;
  final String? profilePhoto;
  final String createdAt;

  CustomerProfileModel({required this.id, required this.fullName, required this.email, required this.address, required this.city, required this.pincode, required this.profilePhoto, required this.createdAt});

  factory CustomerProfileModel.fromJson(Map<String, dynamic> json) {
    return CustomerProfileModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      email: json['email'],
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      pincode: json['pincode'] ?? '',
      profilePhoto: json['profile_photo'],
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'address': address,
    'city': city,
    'pincode': pincode,
    'profile_photo': profilePhoto,
    'created_at': createdAt,
  };
}
