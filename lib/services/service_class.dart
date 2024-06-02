import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hangman_game/constants/url.dart';
import 'package:hangman_game/models/signup_model.dart';
import 'package:http/http.dart' as http;

Future<http.Response?> register(SignupBody data) async {
  http.Response? response;
  try {
    response =
        await http.post(Uri.parse("${AppUrl.baseUrl}/api/user/signup.php"),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: jsonEncode(data.toJson()));
    print(jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
    print(e);
  }
  return response;
}
