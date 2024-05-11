import 'package:flutter/material.dart';
import 'package:hangman_game/providers/dark_theme_provider.dart';

import 'package:hangman_game/providers/word_data_provider.dart';
import 'package:hangman_game/screens/game_screen.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WordData wordDataProvider = WordData();
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => wordDataProvider),
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
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

    // ChangeNotifierProvider(
    //     create: (context) => WordData(),
    //     builder: (context, child) {
    //       Provider.of<WordData>(context, listen: false).checkFin();
    //       return MaterialApp(
    //         theme: ThemeData.dark(),
    //         home: GameScreen(),
    //       );
    //     });
  }
}
