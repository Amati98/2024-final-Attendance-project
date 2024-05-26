import 'package:final_year/service/provider.dart';
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
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
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
        Navigator.pushNamed(context, "/forgetPasword");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 50,
              ),
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
              child: Text(
                "Staff Portal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Staff ID",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 40),
            LoginButton(
              onPressed: _isLoading ? null : _login,
              buttonText: 'Login',
              buttonColor: const Color(0xFF4FCA8A),
              textColor: Colors.black,
            ),
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
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
