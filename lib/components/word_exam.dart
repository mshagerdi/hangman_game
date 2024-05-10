import 'package:flutter/material.dart';
import 'package:hangman_game/providers/word_data.dart';
import 'package:provider/provider.dart';

class WordExam extends StatelessWidget {
  const WordExam({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordData>(context);
    List<Text> _charactresTextList = [];
    List<Text> getCharactersList() {
      provider.wordCharactersList.forEach(
        (key) {
          _charactresTextList.add(
            Text(
              provider.wordCharactersMap[key]! || provider.isFin ? key : '—',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: provider.wordCharactersMap[key]!
                    ? Colors.green[800]
                    : Colors.red[800],
              ),
            ),
          );
        },
      );
      return _charactresTextList;
    }

    return Container(
      padding: EdgeInsets.all(13),
      child: Container(
        height: 33,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getCharactersList(),
          ),
        ),
      ),
    );
  }
}
