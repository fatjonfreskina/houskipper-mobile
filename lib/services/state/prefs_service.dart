import 'package:app/models/user_model.dart';
import 'package:app/services/state/prefs_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  Future<void> setUserPrefs(SharedPreferences prefs, User user) async {
    await prefs.setString(kPrefUserEmail, user.email);
    await prefs.setInt(kPrefUserId, user.id);
    await prefs.setString(kPrefUserName, user.firstName);
    await prefs.setString(kPrefUserLastName, user.lastName);
  }

  User loadUser(SharedPreferences prefs) {
    String email = prefs.getString(kPrefUserEmail)!;
    String userName = prefs.getString(kPrefUserName)!;
    String userLastName = prefs.getString(kPrefUserLastName)!;
    int userId = prefs.getInt(kPrefUserId)!;

    return User(
        id: userId, email: email, firstName: userName, lastName: userLastName);
  }

  void clearPrefs(SharedPreferences prefs) {
    prefs.remove(kPrefUserEmail);
    prefs.remove(kPrefUserId);
    prefs.remove(kPrefUserName);
    prefs.remove(kPrefUserLastName);
    prefs.remove(kPrefJwt);
  }

  void printPrefs(SharedPreferences prefs) {
    if (kDebugMode) {
      print('User email: ${prefs.getString(kPrefUserEmail)}');
      print('User id: ${prefs.getInt(kPrefUserId)}');
      print('User name: ${prefs.getString(kPrefUserName)}');
      print('User last name: ${prefs.getString(kPrefUserLastName)}');
    }
  }
}
