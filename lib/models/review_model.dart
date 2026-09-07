class ReviewModel {
  final int id;
  final int serviceRequest;
  final int rating;
  final String comment;
  final String createdAt;

  ReviewModel({required this.id, required this.serviceRequest, required this.rating, required this.comment, required this.createdAt});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? 0,
      serviceRequest: json['service_request'] ?? 0,
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'service_request': serviceRequest,
    'rating': rating,
    'comment': comment,
    'created_at': createdAt,
  };
}
