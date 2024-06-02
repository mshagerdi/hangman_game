import 'package:flutter/cupertino.dart';
import 'package:hangman_game/models/signup_model.dart';
import 'package:hangman_game/services/service_class.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  Future<void> postData(SignupBody body) async {
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
}
