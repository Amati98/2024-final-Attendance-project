import 'package:final_year/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onCheckingInOut = false;
  DateTime now = DateTime.now();

  // Format time in 12-hour format
  late String formattedTime;
  late String formattedDate;
  late String formattedMonthYear;

    // TextEditingController for TextField
  late TextEditingController textFieldController;

    @override
  void initState() {
    super.initState();
    // Initialize the controller with a default value
    textFieldController = TextEditingController(text: 'Your default value');
  }

    @override
  void dispose() {
    // Dispose the controller when it's no longer needed
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formattedTime = DateFormat('h:mm a').format(now.toLocal());
    formattedDate = DateFormat('d').format(now.toLocal());
    formattedMonthYear = DateFormat('MMMM, yyyy').format(now.toLocal());

    return Scaffold(
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
          const SizedBox(height: 5,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Visibility(
               visible: onCheckingInOut,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: Color.fromARGB(255, 33, 156, 55), // Background color
                 ),
                 onPressed: () {
                   // Handle Check In button press
                 },
                 child: Text('CheckIn'),
               ),
             ),
             Visibility(
               visible: onCheckingInOut,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: Color(0xffBD9055), // Background color
                 ),
                 onPressed: () {
                   // Handle Check Out button press
                 },
                 child: Text('CheckOut'),
               ),
             ),
           ],
         ),
          //second column check in/out
          const SizedBox(
            height: 80,
          ),
           buildCheckedWidget("Checked In",  const Color(0xff54B84B)),
           buildCheckedWidget("Checked Out",  const Color(0xffBD9055)),
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
    );
  }
  Widget buildCheckedWidget(String text, Color color) {
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
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter',
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
