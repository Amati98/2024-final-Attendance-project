import 'package:flutter/material.dart';

class MyDateTime {
  MyDateTime();

  int timeFunction() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the time from the DateTime object
    int hour = now.hour;
    int minute = now.minute;

    return timeFunction();
    // Print the time
  }

  int dateFunction() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Get the date from the DateTime object
    int year = now.year;
    int month = now.month;
    int day = now.day;

    // Print the date
    return dateFunction();
  }
}
