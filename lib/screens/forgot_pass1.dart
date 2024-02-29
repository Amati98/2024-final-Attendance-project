import 'package:final_year/screens/forgot_pass2.dart';
import 'package:final_year/screens/student_login.dart';
import 'package:flutter/material.dart';

class ForgotPassword1 extends StatelessWidget {
  ForgotPassword1({super.key});

  final email = TextEditingController();

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
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Enter your email account to reset password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Itim'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Container(
                width: 310,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2),
                ),
                child: TextFormField(
                  controller: email,
                  style: const TextStyle(fontFamily: 'Itim', fontSize: 20),
                  decoration: const InputDecoration(
                    hintText: "Email",
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
                    minimumSize: const Size(340, 44),
                    backgroundColor: Colors.black,
                  ), // background
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword2()),
                    );
                  },
                  child: const Text(
                    'Contiinue',
                    style: TextStyle(
                        fontSize: 30, fontFamily: 'Itim', color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Remember Password?",
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                    ),
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
                          fontSize: 22,
                          fontFamily: 'Itim'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
