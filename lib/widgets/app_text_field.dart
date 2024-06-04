import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/utilities/constants.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final bool? isObscure;

  AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscured = false;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            if (widget.hintText == passwordText) _password = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter some text';
          if (value.length < 3) return 'can\'t be less than 3 characters.';
          if (widget.hintText.contains(emailText) &&
              !widget.hintText.contains('@'))
            return 'Please enter a valid Email';

          if (widget.hintText == rePasswordText && value != _password)
            return 'Password mismatch';

          return null;
        },
        keyboardType: widget.hintText.contains(emailText)
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        obscureText: _isObscured,
        controller: widget.textController,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          //hintText,
          hintText: widget.hintText,
          // prefixIcon
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey[600],
          ),
          suffixIcon: widget.isObscure == null
              ? null
              : IconButton(
                  icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  }),
          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          //enabled Border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          // enabledBorder
          //
          // border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
