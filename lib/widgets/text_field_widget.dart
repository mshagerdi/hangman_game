import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    required this.hintText,
    required this.icon,
    this.hideText,
    required this.textController,
  });

  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool? hideText;

  @override
  Widget build(BuildContext context) {
    final _hideTheText = hideText ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: TextField(
            keyboardType: _hideTheText
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: _hideTheText,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
