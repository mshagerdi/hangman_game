import 'package:flutter/material.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:hangman_game/widgets/app_button.dart';
import 'package:hangman_game/widgets/app_text_field.dart';
import 'package:hangman_game/widgets/custom_button_widget.dart';
import 'package:hangman_game/widgets/text_field_widget.dart';

class CustomLoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 22),
          // TextFieldWidget(
          //     hintText: 'Email', icon: Icons.drive_file_rename_outline),
          // SizedBox(height: 13),
          // TextFieldWidget(
          //   hintText: 'Password',
          //   icon: Icons.password_sharp,
          //   hideText: true,
          // ),
          //username
          AppTextField(
            textController: userController,
            hintText: usernameText,
            icon: Icons.person,
          ),
          SizedBox(
            height: 20,
          ),
          //your password
          AppTextField(
            textController: passwordController,
            hintText: passwordText,
            icon: Icons.password_sharp,
            isObscure: true,
          ),
          SizedBox(
            height: 20 + 20,
          ),
          SizedBox(height: 13),
          // CustomButtonWidget(buttonLabel: 'Submit'),
          GestureDetector(
            onTap: () {},
            child: AppButton(
              buttonText: signInText,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Forget Password'),
          ),
        ],
      ),
    );
  }
}
