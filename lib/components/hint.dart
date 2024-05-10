import 'package:flutter/material.dart';
import 'package:hangman_game/providers/word_data.dart';
import 'package:provider/provider.dart';

class Hint extends StatelessWidget {
  const Hint({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordData>(context);
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(13),
        child: Padding(padding: EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Align(
              child: Text(
                provider.getHint,
                style: TextStyle(
                  color: Colors.green,
                ),
                // maxLines: 4,
                // overflow: TextOverflow.ellipsis,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
