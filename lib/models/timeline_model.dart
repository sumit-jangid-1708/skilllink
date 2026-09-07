class TimelineModel {
  final String label;
  final bool done;
  final String? time;

  TimelineModel({required this.label, required this.done, required this.time});

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      label: json['label'] ?? '',
      done: json['done'] ?? false,
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
    'label': label,
    'done': done,
    'time': time,
  };
}
