import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hangman_game/providers/dark_theme_provider.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({super.key});

  @override
  IconButton build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context, listen: false);
    return IconButton(
      onPressed: () {
        theme.darkTheme = !theme.darkTheme;
      },
      icon: Icon(theme.darkTheme ? Icons.nightlight : Icons.sunny),
    );
  }
}
