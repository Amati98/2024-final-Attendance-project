import 'package:final_year/service/providers/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:intl/intl.dart';

class AttendancePage extends ConsumerWidget {
  final int id;

  const AttendancePage({Key? key, required this.id}) : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceHistories = ref.watch(attendanceNotifierProvider);
     // Format the date and time
    final dateFormat = DateFormat('EEE d');
    final timeFormat = DateFormat('h:mma');
    final filteredAttendances = attendanceHistories.where((attendance) => attendance.staffId == id).toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            'Attendance',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false, // This removes the back arrow
          // iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Text(
                  'Attendance Details',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredAttendances.length,
                    itemBuilder: (context, index) {
                      final attendance = filteredAttendances[index];
                      final formattedDate = dateFormat.format(attendance.date);
                      final formattedTimeIn = timeFormat.format(attendance.timeIn);
                      final formattedTimeOut = timeFormat.format(attendance.timeOut);
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${formattedDate.toString()}'),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('${formattedTimeIn.toString()}'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('${formattedTimeOut.toString()}'),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // loading: () => CircularProgressIndicator(),
          // error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      // ),
    );
  }
}
