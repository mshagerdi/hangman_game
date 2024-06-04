import 'package:flutter/material.dart';
import 'package:hangman_game/components/character_buttons.dart';
import 'package:hangman_game/components/hangman_image.dart';
import 'package:hangman_game/components/hint.dart';
import 'package:hangman_game/components/word_exam.dart';
import 'package:hangman_game/providers/word_data_provider.dart';
import 'package:hangman_game/screens/tabs_screen.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:hangman_game/widgets/theme_button_widget.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game_screen';

  @override
  Widget build(BuildContext context) {
    Provider.of<WordData>(context, listen: false).checkFin();
    final wordData = Provider.of<WordData>(context);

    return Scaffold(
      appBar: AppBar(
        title: appTitle,
        actions: [
          ThemeButtonWidget(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TabsScreen.routeName);
            },
            icon: Icon(Icons.person_3_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HangmanImage(),
          WordExam(),
          Hint(),
          CharacterButtons(),
          ElevatedButton(
            onPressed: () {
              Provider.of<WordData>(context, listen: false).newWord();
            },
            child: wordData.word == '' ? Text('Start') : Text('New word!'),
          ),
        ],
      ),
    );
  }
}
