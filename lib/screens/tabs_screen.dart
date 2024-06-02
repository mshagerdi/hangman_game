import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hangman_game/components/login_tab.dart';
import 'package:hangman_game/components/signup_tab.dart';
import 'package:hangman_game/widgets/theme_button_widget.dart';

class TabsScreen extends StatelessWidget {
  static const routeName = '/tabs_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('H A N G 𓍯 M A N'),
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
            LoginTab(),
            SignupTab(),
          ],
        ),
      ),
    );
  }
}
