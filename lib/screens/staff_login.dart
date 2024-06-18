import 'package:final_year/service/providers/provider.dart';
import 'package:final_year/widgets/loginButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:your_app/models/user.dart';
// import 'package:your_app/providers/login_provider.dart';

class StaffLogin extends ConsumerStatefulWidget {
  const StaffLogin({super.key});

  @override
  ConsumerState<StaffLogin> createState() => _StaffLoginState();
}

class _StaffLoginState extends ConsumerState<StaffLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool _passwordInVisible = true;
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    if(_formkey.currentState!.validate()){
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final credentials = {
        'username': usernameController.text,
        'password': passwordController.text,
      };

      // Read the provider and trigger the login process
      final user = await ref.read(loginProvider(credentials).future);
      // Save the user data
      ref.read(userProvider.notifier).setUser(user);

      // Handle successful login (e.g., navigate to another page or update UI)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
      Navigator.pushNamed(context, "/dashboard");
    } catch (error) {
      // Handle error during login
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
                    Center(
                      child: Text(
                        'Staff Portal',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    TextFormField(
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return 'Password must not be empty';
                        }
                      },
                      controller: passwordController,
                      obscureText: _passwordInVisible,
                      decoration: InputDecoration(
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordInVisible =
                                  !_passwordInVisible; //change boolean value
                            });
                          },
                          icon: Icon(
                            _passwordInVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
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
                    const SizedBox(height: 40),
                    LoginButton(
                      onPressed: _isLoading ? null : _login,
                      buttonText: 'Login',
                      buttonColor: const Color(0xFF4FCA8A),
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 50),

                    // InkWell(
                    //   onTap: () {
                    //     print({_formkey.currentState!.validate(), 'Login'});
                    //     if (_formkey.currentState!.validate()) {
                    //       _isLoading ? null : _login;
                    //     }
                    //   },
                    //   child: Container(
                    //     margin: const EdgeInsets.symmetric(horizontal: 20),
                    //     padding: const EdgeInsets.symmetric(vertical: 15),
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: Colors.green.shade900),
                    //     child: const Center(
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        'Login failed: $_errorMessage',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
