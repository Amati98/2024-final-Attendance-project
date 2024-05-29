import 'package:final_year/service/models/staff_models.dart';

class Attendance {
  final int id;
  final int staffId;
  final DateTime date;
  final DateTime timeIn;
  final DateTime timeOut;
  final Staff staff;

  Attendance({
    required this.id,
    required this.staffId,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.staff,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      staffId: json['staffId'],
      date: DateTime.parse(json['date']),
      timeIn: DateTime.parse(json['timeIn']),
      timeOut: DateTime.parse(json['timeOut']),
      staff: Staff.fromJson(json['staff']),
    );
  }
}
