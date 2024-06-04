// import 'package:flutter/material.dart';
// import 'package:hangman_game/widgets/custom_button_widget.dart';
// import 'package:hangman_game/widgets/text_field_widget.dart';
//
// class SignupTab extends StatelessWidget {
//   const SignupTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 22),
//           TextFieldWidget(hintText: 'Full Name'),
//           SizedBox(height: 26),
//           TextFieldWidget(hintText: 'Email'),
//           SizedBox(height: 13),
//           TextFieldWidget(
//             hintText: 'Password',
//             hideText: true,
//           ),
//           SizedBox(height: 13),
//           TextFieldWidget(
//             hintText: 'Re-type Password',
//             hideText: true,
//           ),
//           SizedBox(height: 26),
//           TextFieldWidget(hintText: 'Select Username'),
//           SizedBox(height: 13),
//           CustomButtonWidget(buttonLabel: 'Submit'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/models/signup_model.dart';
import 'package:hangman_game/providers/authentication_provider.dart';
import 'package:hangman_game/screens/home_page.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:hangman_game/widgets/app_button.dart';
import 'package:hangman_game/widgets/app_text_field.dart';
import 'package:hangman_game/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSignupTab extends StatelessWidget {
  const CustomSignupTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var userController = TextEditingController();
    var passwordController = TextEditingController();
    var rePasswordController = TextEditingController();
    var nameController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    Future<void> _registration() async {
      String name = nameController.text.trim();
      String rePassword = rePasswordController.text.trim();
      String email = emailController.text.trim();
      String username = userController.text.trim();
      String password = passwordController.text.trim();
      SignupBody signupBody = SignupBody(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      var provider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      await provider.postData(signupBody);
      if (provider.isBack) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabsScreen(),
          ),
        );
      }
    }

    return Consumer<AuthenticationProvider>(
      builder: (context, data, child) {
        return data.loading
            ? Center(
                child: Container(
                  child: SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              )
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 22),
                      //app logo
                      // Container(
                      //   height: 100,
                      //   child: Center(
                      //     child: CircleAvatar(
                      //       backgroundColor: Colors.grey[300],
                      //       radius: 80,
                      //     ),
                      //   ),
                      // ),
                      //Your Name
                      AppTextField(
                        textController: nameController,
                        hintText: nameText,
                        icon: Icons.drive_file_rename_outline,
                      ),
                      // TextFieldWidget(
                      //   hintText: "Full Name",
                      //   icon: Icons.drive_file_rename_outline,
                      // ),
                      SizedBox(
                        height: 20 + 10,
                      ),
                      //your email
                      AppTextField(
                        textController: emailController,
                        hintText: emailText,
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //username
                      AppTextField(
                        textController: userController,
                        hintText: usernameText,
                        icon: Icons.person,
                      ),
                      SizedBox(
                        height: 20 + 10,
                      ),
                      //your password
                      AppTextField(
                        textController: passwordController,
                        hintText: passwordText,
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //your password
                      AppTextField(
                        textController: rePasswordController,
                        hintText: rePasswordText,
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: 20 + 20,
                      ),

                      //sign up button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _registration();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error')),
                            );
                          }
                        },
                        child: AppButton(
                          buttonText: signUpText,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //tag line
                      // RichText(
                      //   text: TextSpan(
                      //     text: "Have an account already?",
                      //     style:
                      //         TextStyle(color: Colors.grey[500], fontSize: 20),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      // ),
                      //sign up options
                      // RichText(
                      //   text: TextSpan(
                      //     text: "Sign up using one of the following methods",
                      //     style:
                      //         TextStyle(color: Colors.grey[500], fontSize: 16),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
