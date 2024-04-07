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
  DateTime now = DateTime.now();

  // Format time in 12-hour format
  late String formattedTime;
  late String formattedDate;
  late String formattedMonthYear;

  @override
  Widget build(BuildContext context) {
    formattedTime = DateFormat('h:mm a').format(now.toLocal());
    formattedDate = DateFormat('d').format(now.toLocal());
    formattedMonthYear = DateFormat('MMMM, yyyy').format(now.toLocal());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
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
          ),

          //second column check in/out
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: ElevatedButton(
              //   style: const ButtonStyle(),
              //   onPressed: () {},
              //   child: const Text('Check In/Out'),
              // ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //third Column attendance
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
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
                        color: Color(0xffBD9055),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
