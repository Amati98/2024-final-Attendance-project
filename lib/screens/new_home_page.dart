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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //1st row in column
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
                          style: const TextStyle(
                              color: Color(0xffFFD9A7),
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          formattedMonthYear,
                          style: const TextStyle(
                              color: Color(0xffFFD9A7),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),

                  //2nd row in column
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
                          formattedTime.split(' ')[0], // Display h:mm
                          style: const TextStyle(
                              color: Color(0xffFFD9A7),
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          formattedTime.split(' ')[1], // Display am or pm
                          style: const TextStyle(
                              color: Color(0xffFFD9A7),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: onCheckingInOut,
                    child: InkWell(
                      onTap: () {
                        // Handle Check In button press
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            color: const Color(0xff54B84B),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Check In',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Visibility(
                    visible: onCheckingInOut,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFD9A7),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Check Out',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              //second column check in/out
              const SizedBox(
                height: 40,
              ),
              buildCheckedWidget("Checked In", const Color(0xff54B84B)),
              buildCheckedWidget("Checked Out", const Color(0xffFFD9A7)),
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

              //third Column attendance
              Visibility(
                visible: !onCheckingInOut,
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.fromLTRB(15, 28, 15, 28),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFD9A7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Attendance',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff54B84B)),
                              ),
                              Text('Present',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.brown,
                                  ))
                            ],
                          ),

                          //column2
                          Column(
                            children: [
                              Text(
                                '7',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffC2B260)),
                              ),
                              Text('Late',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.brown,
                                  ))
                            ],
                          ),

                          //column3
                          Column(
                            children: [
                              Text(
                                '7',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffE03F3F)),
                              ),
                              Text('Absent',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.brown,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckedWidget(String text, Color color) {
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
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                Container(
                  width: 120,
                  height: 40,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
