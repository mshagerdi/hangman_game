// import 'package:dictionaryx/dictentry.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hangman_game/utilities/constants.dart';
import 'package:word_generator/word_generator.dart';
import 'package:http/http.dart' as http;
import 'package:free_english_dictionary/free_english_dictionary.dart';

// import 'package:dictionaryx/dictionary_reduced_msa.dart';

class WordData extends ChangeNotifier {
  // var dReducedMSA = DictionaryReducedMSA();

  String _word = 'W E L C O M E';
  Map<String, bool> _wordCharactersMap = {};
  Map<String, bool> _charactersMap = {};
  List<String> _wordCharactersList = [];

  String _hint = 'WELCOME';
  List<String> _hints = [];

  int _falseAnswersCount = 0;
  int _correctAnswersCount = 0;
  int _score = 0;
  bool _isFin = false;

  final wordGenerator = WordGenerator();

  String get word {
    return _word;
  }

  int get getScore {
    return _score;
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

  String get getHint {
    return _hint;
  }

  void newHint() async {
    if (_hints.asMap().containsKey(_falseAnswersCount))
      _hint = _hints[_falseAnswersCount - 1];

    notifyListeners();
  }

  Future<void> fetchAndSetHints() async {
    _hints = [];

    String apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$_word';

    final response = await http.get(Uri.parse(apiUrl));
    final extractedData = json.decode(response.body)[0]['meanings'] as List;
    if (extractedData == null) {
      print('Extracted data is null.');
      return;
    }
    _hints.add(extractedData[0]['partOfSpeech']);
    extractedData[0]['definitions'].forEach((definition) {
      if (!definition['definition'].contains(_word))
        _hints.add(definition['definition']);
    });
    print(_hints);
  }

  void newWord() {
    _isFin = false;

    _hint = '';
    _hints = [];

    if (_falseAnswersCount == 6) _score = 0;

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

    fetchAndSetHints();

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
      _score++;
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
      newHint();
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
