import 'package:final_year/screens/password_changed.dart';
import 'package:final_year/screens/student_login.dart';
import 'package:flutter/material.dart';

class ForgotPassword3 extends StatelessWidget {
  ForgotPassword3({super.key});

  final confirmPassword = TextEditingController();
  final firstPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFE0E0E0),
                height: 214,
                width: screenWidth,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 110),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 43,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Itim'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        textAlign: TextAlign.right,
                        'Reset your password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Itim'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Container(
                width: 310,
                height: 49,
                decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 2,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2),
                ),
                child: TextFormField(
                  controller: firstPassword,
                  style: const TextStyle(fontFamily: 'Itim', fontSize: 26),
                  decoration: const InputDecoration(
                    hintText: "New Password",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 310,
                height: 49,
                decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 2,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2),
                ),
                child: TextFormField(
                  controller: confirmPassword,
                  style: const TextStyle(fontFamily: 'Itim', fontSize: 26),
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 44),
                    backgroundColor: Colors.black,
                  ), // background
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordChanged()),
                    );
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                        fontSize: 30, fontFamily: 'Itim', color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentLogin()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 26,
                      fontFamily: 'Itim'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
