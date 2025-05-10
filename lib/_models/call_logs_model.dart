import 'dart:ui';

class CallModel {
  final String icon;
  final String number;
  final String time;
  final String day;
  final VoidCallback onDelete;

  CallModel({
    required this.icon,
    required this.number,
    required this.time,
    required this.day,
    required this.onDelete,
  });
}
