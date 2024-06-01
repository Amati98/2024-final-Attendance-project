import 'package:final_year/service/models/staff_models.dart';

class Attendance {
  final int id;
  final int staffId;
  final DateTime date;
  final DateTime timeIn;
  final DateTime timeOut;
  final Staff? staff;

  Attendance({
    required this.id,
    required this.staffId,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    this.staff,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      staffId: json['staffId'],
      date: DateTime.parse(json['date']),
      timeIn: DateTime.parse(json['timeIn']),
      timeOut: DateTime.parse(json['timeOut']),
      staff: json['staff'] != null ? Staff.fromJson(json['staff']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'staffId': staffId,
      'date': date.toIso8601String(),
      'timeIn': timeIn.toIso8601String(),
      'timeOut': timeOut.toIso8601String(),
    };
  }
}
