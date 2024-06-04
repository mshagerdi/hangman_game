import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 23),
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFF74beef),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]),
    );
  }
}
