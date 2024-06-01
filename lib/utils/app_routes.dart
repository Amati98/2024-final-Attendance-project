
import 'package:final_year/screens/dashboard_screen.dart';
import 'package:final_year/screens/forgot_pass1.dart';
import 'package:final_year/screens/splash_screen.dart';
import 'package:final_year/screens/staff_login.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => const SplashScreen(),
    "/forgetPasword": (context) => ForgotPassword1(),
    "/dashboard": (context) => DashboardScreen()
    // Add more routes here as needed
  };
}
