import 'package:final_year/screens/dashboard_screen.dart';
import 'package:final_year/screens/staff_Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const StaffLogin();
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    startScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Image.asset('assets/logo.png', height: 200),
      ),
    );
  }
}
