// attendance_notifier.dart

import 'package:final_year/service/models/attendance_models.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceNotifier extends StateNotifier<List<Attendance>> {
  final ApiService apiService;

  AttendanceNotifier(this.apiService) : super([]) {
    fetchAttendanceHistories();
  }

  Future<void> fetchAttendanceHistories() async {
    try {
      final attendanceHistories = await apiService.fetchAttendanceHistories();
      state = attendanceHistories;
    } catch (error) {
      // Handle error
      print(error);
    }
  }

  void addAttendance(Attendance attendance) {
    state = [...state, attendance];
  }
}

final attendanceNotifierProvider =
    StateNotifierProvider<AttendanceNotifier, List<Attendance>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AttendanceNotifier(apiService);
});
