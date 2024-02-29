import 'dart:async';
import 'package:final_year/screens/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const Category());
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          height: 228,
          width: 221,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
