import 'package:final_year/screens/staff_main_login.dart';
import 'package:final_year/widgets/input_fields.dart';
import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final idController3 = TextEditingController();
  final passwordController3 = TextEditingController();
  final confirmPassController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/logo.png",
                    height: 138,
                    width: 134,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Sign Up Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 35),
                InputTextField(
                    prefixIcon: const Icon(Icons.person),
                    controller: nameController,
                    obsecureText: false,
                    hintText: 'Full Name'),
                const SizedBox(height: 10),
                InputTextField(
                    prefixIcon: const Icon(Icons.mail),
                    controller: emailController,
                    obsecureText: false,
                    hintText: 'Emaiil'),
                const SizedBox(height: 10),
                InputTextField(
                    prefixIcon: const Icon(Icons.person_4_outlined),
                    controller: idController3,
                    obsecureText: false,
                    hintText: 'Staff/Student ID'),
                const SizedBox(height: 10),
                InputTextField(
                    prefixIcon: const Icon(Icons.lock),
                    controller: passwordController3,
                    obsecureText: true,
                    hintText: 'Password'),
                const SizedBox(height: 10),
                InputTextField(
                    prefixIcon: const Icon(Icons.lock),
                    controller: confirmPassController3,
                    obsecureText: true,
                    hintText: 'Confirm Password'),
                const SizedBox(height: 40),
                LoginButton(
                  onPressed: () {},
                  buttonText: 'Sign Up',
                  buttonColor: const Color(0xFF4FCA8A),
                  textColor: Colors.black,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffMainLogin()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
