import 'package:final_year/screens/student_login.dart';
import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD9A7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset("assets/logo.png", height: 227, width: 310),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Password Changed Successfully',
              style: TextStyle(
                fontFamily: "Itim",
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LoginButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentLogin()),
                  );
                },
                buttonText: 'Login Now',
                buttonColor: Colors.black,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
