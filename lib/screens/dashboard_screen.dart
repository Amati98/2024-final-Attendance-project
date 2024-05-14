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
// CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           title: Padding(
//             padding: const EdgeInsets.only(left: 24),
//             child: Text(
//               'Track Parcel',
//               style: Theme.of(context).textTheme.headline1,
//             ),
//           ),
//           centerTitle: false,
//           floating: true,
//           snap: false,
//           pinned: true,
//           titleSpacing: 0.0,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 24),
//               child: CircleAvatar(
//                 child: ClipOval(
//                   child: Image.network(ImageUtils.icProfile),
//                 ),
//               ),
//             ),
//           ],
//           shadowColor: Colors.transparent,
//           expandedHeight: 316,
//           backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(16),
//               bottomLeft: Radius.circular(16),
//             ),
//           ),
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
