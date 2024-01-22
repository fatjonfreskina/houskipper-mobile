import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  SharedPreferences? prefs;

  PrefsManager() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  // Example method to get a String value from preferences
  String? getString(String key) {
    return prefs?.getString(key);
  }

  // Example method to set a String value to preferences
  Future<void> setString(String key, String value) async {
    await prefs?.setString(key, value);
  }
}
