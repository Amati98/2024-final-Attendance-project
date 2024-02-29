import 'package:final_year/screens/attendance_page.dart';
import 'package:final_year/screens/home_page.dart';
import 'package:final_year/screens/notification_page.dart';
import 'package:final_year/screens/profile_page.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List pages = [
    const HomePage(),
    const AttendancePage(),
    const NotificationPage(),
    const ProfilePage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0E0E0),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Change Password '),
              onTap: () {},
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF5F5F5),
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor:
            const Color.fromARGB(255, 104, 104, 104).withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Attendance", icon: Icon(Icons.list)),
          BottomNavigationBarItem(
              label: "Notification", icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
