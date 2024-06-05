import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const USER_STATUS = 'USERSTATUS';

  saveStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(USER_STATUS, value);
  }

  Future<bool> loadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(USER_STATUS) ?? false;
  }
}
