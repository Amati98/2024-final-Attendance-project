import 'package:final_year/screens/forgot_pass1.dart';
import 'package:flutter/material.dart';

class StaffMainLogin extends StatefulWidget {
  const StaffMainLogin({super.key});

  @override
  State<StaffMainLogin> createState() => _StaffMainLoginState();
}

class _StaffMainLoginState extends State<StaffMainLogin> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 158,
                  width: 154,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Staff Portal",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),

                //ID/EMAIL
                Container(
                  width: 330,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: idController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Staff ID",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                // InputTextField(
                //     controller: idController,
                //     obsecure: false,
                //     hintText: 'Student ID'),

                const SizedBox(height: 18),

                //PASSWORD
                Container(
                  width: 330,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                // InputTextField(
                //     controller: passwordController,
                //     obsecure: true,
                //     hintText: 'Password'),
                const SizedBox(
                  height: 5,
                ),

                //FORGET PASSWORD
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword1()),
                        );
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                //login button
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF4FCA8A),
                        ), // background
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // new user? sign up
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       "New User?",
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     ),
                //     TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const SignUp()),
                //         );
                //       },
                //       child: Text(
                //         "Sign Up",
                //         style: TextStyle(
                //           color: Colors.blue[200],
                //           fontSize: 20,
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
