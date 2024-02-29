import 'dart:async';

import 'package:final_year/screens/category.dart';
import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const Category());
    });
    return Scaffold(
      backgroundColor: const Color(0xFFFFD9A7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Image.asset("assets/logo.png", height: 227, width: 310),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Account Created',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Successfully',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LoginButton(
                onPressed: () {},
                buttonText: 'Loign',
                buttonColor: Colors.black,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
