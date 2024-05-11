import 'package:flutter/material.dart';
import 'package:hangman_game/providers/word_data_provider.dart';
import 'package:provider/provider.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordData>(context);

    return Container(
      margin: EdgeInsets.only(left: 13),
      child: Text(
        'Score: ${provider.getScore}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
