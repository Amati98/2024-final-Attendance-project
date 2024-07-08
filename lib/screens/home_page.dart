import 'dart:math';

import 'package:final_year/constants.dart';
import 'package:final_year/service/models/attendance_models.dart';
import 'package:final_year/service/providers/attendance.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  final int id;

  const HomePage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Location _location = Location();
  final LatLng schoolLocation = LatLng(
      5.5601040, -0.2969782); // Replace with your school's latitude and longitude
  final double radius = 100; // Radius in meters

  bool _isWithinRadius = false;


  void _checkLocation() async {
    var locationData = await _location.getLocation();
    double distance = _calculateDistance(
      locationData.latitude!,
      locationData.longitude!,
      schoolLocation.latitude,
      schoolLocation.longitude,
    );
    setState(() {
      _isWithinRadius = distance < radius;
    });
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000; // distance in meters
  }

  bool onCheckingInOut = false;
  DateTime now = DateTime.now();
  bool isCheckedIn = false;
  bool isCheckOutEnabled = false;
  bool areButtonsDisabled = false;

  late String formattedTime;
  late String formattedDate;
  late String formattedMonthYear;

  late TextEditingController checkInController;
  late TextEditingController checkOutController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with a default value
     _checkLocation();

    checkInController = TextEditingController(text: '');
    checkOutController = TextEditingController(text: '');
    initializeState();
  }

  @override
  void dispose() {
    checkInController.dispose();
    checkOutController.dispose();
    super.dispose();
  }

  void initializeState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? checkInTime = prefs.getString('checkInTime');
    String? checkOutTime = prefs.getString('checkOutTime');
    String today = DateFormat('yyyy-MM-dd').format(now);

    if (checkInTime != null && checkInTime.startsWith(today)) {
      setState(() {
        isCheckedIn = true;
        isCheckOutEnabled = true;
        checkInController.text =
            DateFormat('h:mm a').format(DateTime.parse(checkInTime));
        areButtonsDisabled = true; // Disable buttons if already checked in
      });
    }

    if (checkOutTime != null && checkOutTime.startsWith(today)) {
      setState(() {
        isCheckedIn = false;
        isCheckOutEnabled = false;
        areButtonsDisabled = true;
        checkOutController.text =
            DateFormat('h:mm a').format(DateTime.parse(checkOutTime));
      });
    }
  }

  void handleCheckIn() async {
    setState(() {
      isCheckedIn = true;
      isCheckOutEnabled = true;
      now = DateTime.now();
      checkInController.text = DateFormat('h:mm a').format(now);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('checkInTime', now.toIso8601String());
  }

  void handleCheckOut() async {
    setState(() {
      isCheckedIn = false;
      isCheckOutEnabled = false;
      now = DateTime.now();
      checkOutController.text = DateFormat('h:mm a').format(now);
      areButtonsDisabled = true; // Disable buttons after check-out
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('checkOutTime', now.toIso8601String());
    postAttendance();
  }

  Future<void> postAttendance() async {
    final formattedDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(now);
    final DateTime checkInTime =
        DateFormat('h:mm a').parse(checkInController.text);
    final DateTime checkOutTime =
        DateFormat('h:mm a').parse(checkOutController.text);

    final formattedCheckInTime =
        DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(checkInTime);
    final formattedCheckOutTime =
        DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(checkOutTime);
    final postData = {
      'staffId': widget.id.toString(),
      'date': formattedDateTime.toString(),
      'timeIn': formattedCheckInTime,
      'timeOut': formattedCheckOutTime,
    };

    try {
      final Attendance newAttendance =
          await ref.read(attendancePostProvider(postData).future);
      ref
          .read(attendanceNotifierProvider.notifier)
          .addAttendance(newAttendance);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Checked In and Out Successful')),
      );
    } catch (e) {
      // Handle the error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    formattedTime = DateFormat('h:mm a').format(now.toLocal());
    formattedDate = DateFormat('d').format(now.toLocal());
    formattedMonthYear = DateFormat('MMMM, yyyy').format(now.toLocal());

    return WillPopScope(
      onWillPop: () async {
        if (onCheckingInOut) {
          setState(() {
            onCheckingInOut = false;
          });
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade900,
            title: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    height: 158,
                    width: 154,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formattedDate.split(', ')[0],
                            style: bigTextStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            formattedMonthYear,
                            style: smallTextStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1212),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            formattedTime.split(' ')[0],
                            style: bigTextStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(formattedTime.split(' ')[1],
                              style: smallTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: onCheckingInOut,
                      child: InkWell(
                        onTap: (isCheckedIn || areButtonsDisabled || !_isWithinRadius)
                            ? null
                            : handleCheckIn,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                              color: areButtonsDisabled
                                  ? Colors.grey
                                  : const Color(0xff54B84B),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Check In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Visibility(
                      visible: onCheckingInOut,
                      child: InkWell(
                        onTap: (isCheckOutEnabled && !areButtonsDisabled && _isWithinRadius)
                            ? handleCheckOut
                            : null,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                              color: areButtonsDisabled
                                  ? Colors.grey
                                  : const Color(0xffFFD9A7),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Check Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                buildCheckedWidget(
                    "Checked In", const Color(0xff54B84B), checkInController),
                buildCheckedWidget(
                    "Checked Out", const Color(0xffFFD9A7), checkOutController),
                Visibility(
                  visible: !onCheckingInOut,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1212),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            onCheckingInOut = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFD9A7),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            'Check In/Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckedWidget(
      String text, Color color, TextEditingController controller) {
    return Visibility(
      visible: onCheckingInOut,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Text(controller.text,
                    style:
                        TextStyle(color: color, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
