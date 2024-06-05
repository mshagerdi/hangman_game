import 'package:flutter/material.dart';
import 'package:hangman_game/providers/authentication_provider.dart';
import 'package:hangman_game/providers/dark_theme_provider.dart';

import 'package:hangman_game/providers/word_data_provider.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  WordData wordDataProvider = WordData();
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();
  AuthenticationProvider authProvider = AuthenticationProvider();

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePreferences.loadTheme();
  }

  void getUserCurrentStatus() async {
    authProvider.loggedIn = await authProvider.userPreferences.loadStatus();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentAppTheme();
    getUserCurrentStatus();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => wordDataProvider),
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
        ChangeNotifierProvider(create: (_) => authProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Hangman Game',
          theme: value.darkTheme ? ThemeData.dark() : ThemeData.light(),
          initialRoute: GameScreen.routeName,
          routes: {
            GameScreen.routeName: (context) => GameScreen(),
            TabsScreen.routeName: (context) => TabsScreen(),
          },
        ),
      ),
    );
  }
}
