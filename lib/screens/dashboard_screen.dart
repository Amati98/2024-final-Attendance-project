import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    );
  }
}
