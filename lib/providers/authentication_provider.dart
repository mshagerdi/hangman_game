import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/models/login_model.dart';
import 'package:hangman_game/models/signup_model.dart';
import 'package:hangman_game/models/user_preferences.dart';
import 'package:hangman_game/services/service_class.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  bool _loggedIn = false;
  bool _isError = false;
  String _password = '';
  UserPreferences userPreferences = UserPreferences();

  bool get isError => _isError;

  bool get loggedIn => _loggedIn;

  set loggedIn(bool value) {
    _loggedIn = value;
    userPreferences.saveStatus(value);
    notifyListeners();
  }

  String get password => _password;

  set setPassword(String value) {
    _password = value;
  }

  Future<void> postSignupData(SignupBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    if (response.statusCode == 200) {
      isBack = true;
      debugPrint("Data ${body.toJson()} posted successfully");
      print("response is: ${response.body}");
    } else {
      debugPrint(
          "Something went wrong! Status Code is: ${response.statusCode}");
    }
    loading = false;
    notifyListeners();
  }

  Future<void> postLoginData(LoginBody body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await login(body))!;
    if (response.statusCode == 200) {
      isBack = true;
      debugPrint("Data ${body.toJson()} posted successfully");
      print("response is: ${response.body}");
      final jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == true) {
        _loggedIn = true;
      } else {
        _isError = true;
      }
    } else {
      debugPrint(
          "Something went wrong! Status Code is: ${response.statusCode}");
    }
    userPreferences.saveStatus(_loggedIn);
    loading = false;
    notifyListeners();
  }
}
