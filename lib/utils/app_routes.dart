
import 'package:final_year/screens/forgot_pass1.dart';
import 'package:final_year/screens/staff_login.dart';
import 'package:flutter/material.dart';
// import 'home_screen.dart';
// import 'staff_login.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    // '/': (context) => const HomeScreen(),
    '/': (context) => const StaffLogin(),
    "/forgetPasword": (context) => ForgotPassword1()
    // Add more routes here as needed
  };
}
