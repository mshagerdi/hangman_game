import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman_game/models/login_model.dart';
import 'package:hangman_game/providers/authentication_provider.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:hangman_game/widgets/app_button.dart';
import 'package:hangman_game/widgets/app_text_field.dart';
import 'package:hangman_game/widgets/custom_button_widget.dart';
import 'package:hangman_game/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class CustomLoginTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    Future<void> _loggingIn() async {
      String username = userController.text.trim();
      String password = passwordController.text.trim();
      LoginBody loginBody = LoginBody(
        username: username,
        password: password,
      );
      var authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      await authProvider.postLoginData(loginBody);
      if (authProvider.isBack) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                authProvider.loggedIn ? GameScreen() : TabsScreen(),
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
                        icon: usernameIcon,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //your password
                      AppTextField(
                        textController: passwordController,
                        hintText: passwordText,
                        icon: passwordIcon,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: 20 + 20,
                      ),
                      SizedBox(height: 13),
                      // CustomButtonWidget(buttonLabel: 'Submit'),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _loggingIn();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Error')),
                            );
                          }
                        },
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
                ),
              );
      },
    );
  }
}
