import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        const SizedBox(height: 20,),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.fromLTRB(15, 28, 15, 28),
            decoration: BoxDecoration(
              color: const Color(0xff54B84B),
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
      ],
    );
  }
}
