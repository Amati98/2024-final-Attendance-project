import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/material.dart';

class StaffLogin extends StatefulWidget {
  const StaffLogin({super.key});

  @override
  State<StaffLogin> createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80,
            horizontal: 30,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                ),
                //imageLOGO
                child: Image.asset(
                  "assets/logo.png",
                  height: 158,
                  width: 154,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 40,
                ),
                //TEXTS
                child: Text(
                  "Staff Portal",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),

              //ID/EMAIL
              Container(
                width: 330,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Staff ID",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              //PASSWORD
              Container(
                width: 330,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
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
              ),
              const SizedBox(
                height: 10,
              ),

              //FORGET PASSWORD
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const SizedBox(
                height: 40,
              ),
              //login button
              LoginButton(
                onPressed: () {},
                buttonText: 'Login',
                buttonColor: const Color(0xFF4FCA8A),
                textColor: Colors.black,
              ),
              const SizedBox(
                height: 10,
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
    );
  }
}
