import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:hangman_game/widgets/character_button.dart';

class CharacterButtons extends StatelessWidget {
  List<CharacterButton> characterButtonList = [];

  List<CharacterButton> buttonsList() {
    for (String character in characters) {
      characterButtonList.add(CharacterButton(character));
    }
    return characterButtonList;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 6,
      padding: EdgeInsets.all(9),
      childAspectRatio: 1.5,
      children: buttonsList(),
    );
  }
}
