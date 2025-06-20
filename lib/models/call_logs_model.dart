import 'dart:ui';

class CallModel {
  final String icon;
  final String number;
  final String time;
  final String day;
  final VoidCallback? onDelete;
  final String? key;

  CallModel({
    required this.icon,
    required this.number,
    required this.time,
    required this.day,
    this.onDelete,
    this.key
  });

  factory CallModel.fromJson(Map<String, dynamic> json,String key) {
    return CallModel(
      day: json['day'],
      icon: json['icon'],
      number: json['number'] ?? '',
      time: json['time'] ?? '',
      key: key,
    );
  }

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'number': number,
    'time': time,
    'day': day,
  };
}
