import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ), // background
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  buttonText,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: textColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
