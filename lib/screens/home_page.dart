import 'package:final_year/constants.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerStatefulWidget {
  final int id;
  const HomePage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool onCheckingInOut = false;
  DateTime now = DateTime.now();
  bool isCheckedIn = false;
  bool isCheckOutEnabled = false;
  bool areButtonsDisabled = false;

  // Format time in 12-hour format
  late String formattedTime;
  late String formattedDate;
  late String formattedMonthYear;

  // TextEditingController for TextField
  late TextEditingController checkInController;
  late TextEditingController checkOutController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with a default value
    checkInController = TextEditingController(text: '');
    checkOutController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // Dispose the controller when it's no longer needed
    checkInController.dispose();
    checkOutController.dispose();
    super.dispose();
  }

  void handleCheckIn() {
    setState(() {
      isCheckedIn = true;
      isCheckOutEnabled = true;
      now = DateTime.now();
      checkInController.text = DateFormat('h:mm a').format(now);
    });
  }

  void handleCheckOut() {
    setState(() {
      isCheckedIn = false;
      isCheckOutEnabled = false;
      now = DateTime.now();
      checkOutController.text = DateFormat('h:mm a').format(now);
      areButtonsDisabled = true; // Disable both buttons after checkout
    });
    // Post attendance after check out
    postAttendance();
  }

  Future<void> postAttendance() async {
    final formattedDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(now);
   // Convert text back to DateTime
  final DateTime checkInTime = DateFormat('h:mm a').parse(checkInController.text);
  final DateTime checkOutTime = DateFormat('h:mm a').parse(checkOutController.text);

  // Format check-in and check-out times correctly
  final formattedCheckInTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(checkInTime);
  final formattedCheckOutTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(checkOutTime);
    final postData = {
      'staffId': widget.id.toString(),
      'date': formattedDateTime.toString(),
      'timeIn': formattedCheckInTime,
      'timeOut': formattedCheckOutTime,
    };
    try {
      await ref.read(attendancePostProvider(postData).future);
       // Handle successful login (e.g., navigate to another page or update UI)
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
          return false; // Prevent default back button action
        }
        return true; // Allow default back button action
      },
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                //1st row in column
                Expanded(
                  child: Container(
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
                ),

                //2nd row in column
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formattedTime.split(' ')[0], // Display h:mm
                          style: bigTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(formattedTime.split(' ')[1], // Display am or pm
                            style: smallTextStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: onCheckingInOut,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color.fromARGB(255, 33, 156, 55), // Background color
                    ),
                    onPressed: (isCheckedIn || areButtonsDisabled)
                        ? null
                        : handleCheckIn,
                    child: Text('CheckIn'),
                  ),
                ),
                Visibility(
                  visible: onCheckingInOut,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffBD9055), // Background color
                    ),
                    onPressed: (isCheckOutEnabled && !areButtonsDisabled)
                        ? handleCheckOut
                        : null,
                    child: Text('CheckOut'),
                  ),
                ),
              ],
            ),
            //second column check in/out
            const SizedBox(
              height: 80,
            ),
            buildCheckedWidget(
                "Checked In", const Color(0xff54B84B), checkInController),
            buildCheckedWidget(
                "Checked Out", const Color(0xffBD9055), checkOutController),
            Visibility(
              visible: !onCheckingInOut,
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffBD9055) // Background color
                          ),
                      onPressed: () {
                        setState(() {
                          onCheckingInOut = true;
                        });
                      },
                      child: Text('Check In/Out'),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //third Column attendance
            Visibility(
              visible: !onCheckingInOut,
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.fromLTRB(15, 28, 15, 28),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFD9A7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Attendance',
                            style: TextStyle(
                              color: Color(0xffBD9055),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //column1
                            Column(
                              children: [
                                Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff54B84B)),
                                ),
                                Text('Presents',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffBD9055)))
                              ],
                            ),

                            //column2
                            Column(
                              children: [
                                Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffC2B260)),
                                ),
                                Text('Late',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffBD9055)))
                              ],
                            ),

                            //column3
                            Column(
                              children: [
                                Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffE03F3F)),
                                ),
                                Text('Absent',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffBD9055)))
                              ],
                            )
                          ],
                        ),
                      ],
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
    );
  }

  Widget buildCheckedWidget(
      String text, Color color, TextEditingController controller) {
    return Visibility(
      visible: onCheckingInOut,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 30,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    color: color,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                SizedBox(
                  width: 120,
                  height: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: TextField(
                        controller: controller,
                        enabled: false, // Make the TextField non-editable
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Set the text color if needed
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
