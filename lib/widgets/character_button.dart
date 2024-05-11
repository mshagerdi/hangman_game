import 'package:flutter/material.dart';
import 'package:hangman_game/providers/word_data_provider.dart';
import 'package:provider/provider.dart';

class CharacterButton extends StatelessWidget {
  String buttonLabel;

  CharacterButton(this.buttonLabel);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordData>(context, listen: false);

    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(1),
        ),
        onPressed: provider.isFin || provider.charactersMap[buttonLabel] == true
            ? null
            : () {
                provider.checkCharacter(buttonLabel);
              },
        child: buttonLabel == ' '
            ? Icon(
                Icons.space_bar,
              )
            : Text(buttonLabel),
      ),
    );
  }
}
