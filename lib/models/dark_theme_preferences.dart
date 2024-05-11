import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = 'THEMESTATUS';

  saveTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
