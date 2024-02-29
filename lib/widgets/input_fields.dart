import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    required this.hintText,
    required this.controller,
    required this.obsecureText,
    required this.prefixIcon,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  final Icon prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 18,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 330,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          obscureText: obsecureText,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFA59A9A),
            ),
          ),
        ),
      ),
    );
  }
}
