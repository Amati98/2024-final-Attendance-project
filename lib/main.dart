import 'package:final_year/screens/student_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // dont forget to write "GetMaterialApp" for the home screen to run
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentLogin(),
    );
  }
}
