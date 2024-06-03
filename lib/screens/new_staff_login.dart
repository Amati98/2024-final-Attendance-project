import 'dart:ui';

import 'package:final_year/screens/dashboard_screen.dart';
import 'package:final_year/screens/home_page.dart';
import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StaffLogin extends StatefulWidget {
  const StaffLogin({super.key});

  @override
  State<StaffLogin> createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
  bool rememberMe = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final resetController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future postLoginToDatabase() async {
    final url =
        Uri.parse('http://app.sipconsult.net/attendancewebapi/api/Staffs');

    final data = {
      "username": usernameController.text,
      "password": passwordController.text
    };
    try {
      final response = await http.post(
        url,
        body: data,
      );
      if (response.statusCode == 200) {
        // Request successful, do something with the response
        // print('Data posted successfully');
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return const HomePage();
        //   }),
        // );
        // print(response.body);
      } else {
        // Request failed, handle the error
        // print('Failed to post data: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            "Something Went Wrong",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        ));
      }
    } catch (e) {
      // An error occurred, handle the exception
      // print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          "Failed to register",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 30,
            ),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/logo.png",
                        height: 158,
                        width: 154,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Center(
                      child: Text(
                        'Staff Portal',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //ID/EMAIL
                    TextFormField(
                      validator: (usernameController) {
                        if (usernameController!.isEmpty) {
                          return 'Username must not be empty';
                        } else {
                          return null;
                        }
                      },
                      textCapitalization: TextCapitalization.words,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    //PASSWORD
                    TextFormField(
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return 'Password must not be empty';
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                    //FORGET PASSWORD
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: rememberMe,
                                activeColor: Colors.green,
                                onChanged: (newRemember) {
                                  setState(() {
                                    rememberMe = newRemember!;
                                  });
                                }),
                            Text('Remember me',
                                style: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 15)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Form(
                                        key: _formkey1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20),
                                            const Text(
                                                'Type your Staff to reset your password',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              validator: (resetController) {
                                                if (resetController!.isEmpty) {
                                                  return 'Staff ID must not be empty';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              controller: resetController,
                                              decoration: const InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  hintText: 'Email',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  prefixIcon: Icon(
                                                    Icons.mail,
                                                  )),
                                            ),
                                            const SizedBox(height: 20),
                                            InkWell(
                                              onTap: () {
                                                if (_formkey1.currentState!
                                                    .validate()) {
                                                  // login();
                                                }
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        Colors.green.shade900),
                                                child: const Center(
                                                  child: Text(
                                                    'Reset',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    //login button
                    InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const DashboardScreen();
                          }));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade900),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )

                    // const SizedBox(
                    //   height: 10,
                    // ),
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
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Sign Up",
                    //         style: TextStyle(
                    //           color: Colors.blue[200],
                    //           fontSize: 20,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
