import 'package:flutter/material.dart';
import 'package:hangman_game/components/character_buttons.dart';
import 'package:hangman_game/components/hangman_image.dart';
import 'package:hangman_game/components/hint.dart';
import 'package:hangman_game/components/word_exam.dart';
import 'package:hangman_game/providers/word_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WordData(),
        builder: (context, child) {
          final provider = Provider.of<WordData>(context);
          Provider.of<WordData>(context, listen: false).checkFin();
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('H A N G 𓍯 M A N'),
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
                    child:
                        provider.word == '' ? Text('Start') : Text('New word!'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
