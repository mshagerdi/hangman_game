import 'package:flutter/material.dart';
import 'package:hangman_game/widgets/custom_button_widget.dart';
import 'package:hangman_game/widgets/text_field_widget.dart';

class LoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 22),
          TextFieldWidget(hintText: 'Email'),
          SizedBox(height: 13),
          TextFieldWidget(
            hintText: 'Password',
            hideText: true,
          ),
          SizedBox(height: 13),
          CustomButtonWidget(buttonLabel: 'Submit'),
          TextButton(
            onPressed: () {},
            child: Text('Forget Password'),
          ),
        ],
      ),
    );
  }
}
