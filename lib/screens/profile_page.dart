import 'package:final_year/service/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final user = ref.watch(userProvider);
   if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('User Profile')),
        body: Center(child: Text('No user logged in')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name: ${user.fname}', style: TextStyle(fontSize: 18)),
            Text('Surname: ${user.sname}', style: TextStyle(fontSize: 18)),
            Text('Other Name: ${user.oname}', style: TextStyle(fontSize: 18)),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
            Text('Gender: ${user.gender}', style: TextStyle(fontSize: 18)),
            Text('Address: ${user.address}', style: TextStyle(fontSize: 18)),
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
