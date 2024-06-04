import 'package:final_year/screens/dashboard_screen.dart';
import 'package:final_year/screens/forgot_pass2.dart';
import 'package:final_year/screens/staff_main_login.dart';
import 'package:final_year/service/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPassword1 extends ConsumerStatefulWidget {
  ForgotPassword1({super.key});

  @override
  ConsumerState<ForgotPassword1> createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends ConsumerState<ForgotPassword1> {
  final cpassword = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  final _formkey = GlobalKey<FormState>();
  // final user = ref.watch(userProvider);
    //  ref
  void _changePassword({
    required int id,
    required String fname,
    required String sname,
    required String oname,
    required String email,
    required String phone,
    required String gender,
    required String address,
    required String username,
    required String password,
  }) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final credentials = {
          "id": id,
          "fname": fname,
          "sname": sname,
          "oname": oname,
          "email": email,
          "phone": phone,
          "gender": gender,
          "address": address,
          "username": username,
          "password": password,
        };

        // Read the provider and trigger the change password process
        await ref.read(changePasswordProvider(credentials).future);
        await Future.delayed(const Duration(seconds: 2), () {});

        // Handle successful password change
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password Changed Successfully')),
        );
        Navigator.pushNamed(context, "/dashboard");
      } catch (error) {
        // Handle error during password change
        setState(() {
          _errorMessage = error.toString();
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
        // Accessing the userProvider using ref.watch
    final user = ref.watch(userProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                          'Change Password',
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
                          'Enter your new password to change password',
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
                    validator: (cpassword) {
                      if (cpassword!.isEmpty) {
                        return 'Password must not be empty';
                      }
                    },
                    controller: cpassword,
                    style: const TextStyle(fontFamily: 'Itim', fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
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
                    onPressed: _isLoading
                        ? null
                        : () => _changePassword(
                              id: user!.id,
                              fname: user.fname,
                              sname: user.sname,
                              oname: user.oname,
                              email: user.oname,
                              phone: user.phone,
                              gender: user.gender.trim(),
                              address: user.address,
                              username: user.username,
                              password: cpassword.text,
                            ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Itim',
                          color: Colors.white),
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
                              builder: (context) => const StaffMainLogin()),
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
      ),
    );
  }

  @override
  void dispose() {
    cpassword.dispose();
    super.dispose();
  }
}

