import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hangman_game/components/custom_login_tab.dart';
import 'package:hangman_game/components/custom_signup_tab.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:hangman_game/widgets/theme_button_widget.dart';

class TabsScreen extends StatelessWidget {
  static const routeName = '/tabs_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: appTitle,
          actions: [
            ThemeButtonWidget(),
            SizedBox(
              width: 48,
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Signup'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CustomLoginTab(),
            CustomSignupTab(),
          ],
        ),
      ),
    );
  }
}
