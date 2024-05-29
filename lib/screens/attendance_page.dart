import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_year/service/providers/provider.dart';

class AttendancePage extends ConsumerWidget {
  final int id;

  const AttendancePage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceHistoriesAsyncValue =
        ref.watch(attendanceHistoriesProvider(id));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            'Attendance',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: attendanceHistoriesAsyncValue.when(
          data: (attendanceHistories) => Container(
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
                    itemCount: attendanceHistories.length,
                    itemBuilder: (context, index) {
                      final attendance = attendanceHistories[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: Column(
                                  children: [
                                    Text('${attendance.date.toLocal()}'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('${attendance.timeIn.toLocal()}'),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('${attendance.timeOut.toLocal()}'),
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
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
