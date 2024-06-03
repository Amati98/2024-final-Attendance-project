import 'package:final_year/screens/attendance_page.dart';
import 'package:final_year/screens/home_page.dart';
import 'package:final_year/screens/map_screen.dart';
import 'package:final_year/screens/notification_page.dart';
import 'package:final_year/screens/profile_page.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  // List pages = [
  //   const HomePage(),
  //   const AttendancePage(id: id,),
  //   const NotificationPage(),
  //   const ProfilePage()
  // ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the user ID from the provider
    final user = ref.watch(userProvider);

    // Check if the user is null
    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    List<Widget> pages = [
      HomePage(id: user.id),
      AttendancePage(id: user.id),
      const MapPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade300,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Attendance", icon: Icon(Icons.list)),
          BottomNavigationBarItem(
              label: "Location", icon: Icon(Icons.location_on)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
