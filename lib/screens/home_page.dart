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
                          height: 20,
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
                          height: 30,
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

          //second column
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          //third Column
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
