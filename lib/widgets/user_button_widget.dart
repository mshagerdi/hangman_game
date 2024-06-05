import 'package:flutter/material.dart';
import 'package:hangman_game/providers/authentication_provider.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class UserButtonWidget extends StatelessWidget {
  const UserButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthenticationProvider>(context);
    return IconButton(
      onPressed: () {
        if (userProvider.loggedIn)
          userProvider.loggedIn = false;
        else
          Navigator.of(context).pushNamed(TabsScreen.routeName);
      },
      icon: Icon(userProvider.loggedIn ? Icons.logout : Icons.person_3_rounded),
    );
  }
}
