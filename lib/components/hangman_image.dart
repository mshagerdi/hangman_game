import 'package:flutter/material.dart';
import 'package:hangman_game/providers/word_data.dart';
import 'package:provider/provider.dart';

class HangmanImage extends StatelessWidget {
  const HangmanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 9),
        color: Colors.grey,
        child: Image(
          image: AssetImage(
              'images/${Provider.of<WordData>(context).falseAnswersCount}.png'),
        ),
      ),
    );
  }
}
