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
    this.key,
  });


  factory CallModel.fromJson(Map<String, dynamic> json, String key) {
    return CallModel(
      icon: json['icon'] ?? '',
      number: json['number'] ?? '',
      time: json['time'] ?? '',
      day: json['day'] ?? '',
      key: key,
    );
  }


  Map<String, dynamic> toJson() => {
    'icon': icon,
    'number': number,
    'time': time,
    'day': day,
  };


  CallModel copyWith({
    String? icon,
    String? number,
    String? time,
    String? day,
    VoidCallback? onDelete,
    String? key,
  }) {
    return CallModel(
      icon: icon ?? this.icon,
      number: number ?? this.number,
      time: time ?? this.time,
      day: day ?? this.day,
      onDelete: onDelete ?? this.onDelete,
      key: key ?? this.key,
    );
  }
}
