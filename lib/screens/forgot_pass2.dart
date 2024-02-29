import 'package:final_year/screens/forgot_pass3.dart';
import 'package:final_year/screens/sign_up.dart';
import 'package:flutter/material.dart';

class ForgotPassword2 extends StatelessWidget {
  ForgotPassword2({super.key});

  final otpCode = TextEditingController();

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
                        'Enter code recieved in mail',
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
                  controller: otpCode,
                  style: const TextStyle(fontFamily: 'Itim', fontSize: 26),
                  decoration: const InputDecoration(
                    hintText: "Otp Code",
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
                          builder: (context) => ForgotPassword3()),
                    );
                  },
                  child: const Text(
                    'Continue',
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
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: Text(
                      "Register",
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
