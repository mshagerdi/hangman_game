import 'package:flutter/material.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:word_generator/word_generator.dart';

class WordData extends ChangeNotifier {
  String _word = 'W E L C O M E';
  Map<String, bool> _wordCharactersMap = {};
  Map<String, bool> _charactersMap = {};
  List<String> _wordCharactersList = [];

  int _falseAnswersCount = 0;
  int _correctAnswersCount = 0;
  bool _isFin = false;

  final wordGenerator = WordGenerator();

  String get word {
    return _word;
  }

  List<String> get wordCharactersList {
    return _wordCharactersList;
  }

  Map<String, bool> get wordCharactersMap {
    return _wordCharactersMap;
  }

  Map<String, bool> get charactersMap {
    return _charactersMap;
  }

  int get wordLength {
    return _wordCharactersList.length;
  }

  int get falseAnswersCount {
    return _falseAnswersCount;
  }

  int get correctAnswersCount {
    return _correctAnswersCount;
  }

  bool get isFin {
    return _isFin;
  }

  void newWord() {
    _isFin = false;
    _falseAnswersCount = 0;
    _correctAnswersCount = 0;
    _word = wordGenerator.randomNoun().toUpperCase();
    _wordCharactersList =
        List<String>.generate(_word.length, (index) => _word[index]);
    _wordCharactersMap = Map.fromIterable(
      _wordCharactersList,
      key: (item) => item,
      value: (item) => false,
    );
    _charactersMap = Map.fromIterable(
      characters,
      key: (item) => item,
      value: (item) => false,
    );

    print(_word);
    print(_wordCharactersList);
    print(_wordCharactersMap);
    print(_charactersMap);

    notifyListeners();
  }

  void checkCharacter(String char) {
    char = char;
    print('Entered key is $char');
    if (_wordCharactersList.contains(char)) {
      _correctAnswersCount++;
      print(
          '$_correctAnswersCount correct answers of ${wordCharactersMap.length}');
      _wordCharactersMap[char] = true;
      _charactersMap[char] = true;
      checkFin();
    } else {
      _falseAnswersCount++;
      _charactersMap[char] = true;
      print('$falseAnswersCount False answers!');
      checkFin();
    }
    notifyListeners();
  }

  void checkFin() {
    if (_falseAnswersCount == 6 ||
        _correctAnswersCount == _wordCharactersMap.length) {
      print('finished');
      _isFin = true;
    }
  }
}
