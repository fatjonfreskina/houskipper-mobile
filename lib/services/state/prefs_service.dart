import 'package:app/models/user_model.dart';
import 'package:app/services/state/prefs_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  Future<void> setUserPrefs(SharedPreferences prefs, User user) async {
    if (kDebugMode) {
      print(
          'Setting user prefs for ${user.email}, id: ${user.id}, name: ${user.firstName} ${user.lastName}');
    }
    await prefs.setString(kPrefUserEmail, user.email);
    await prefs.setInt(kPrefUserId, user.id);
    await prefs.setString(kPrefUserFirstName, user.firstName);
    await prefs.setString(kPrefUserLastName, user.lastName);

    if (kDebugMode) {
      print('User prefs set to: ${prefs.getString(kPrefUserEmail)}, '
          '${prefs.getInt(kPrefUserId)}, '
          '${prefs.getString(kPrefUserFirstName)}, '
          '${prefs.getString(kPrefUserLastName)}');
    }
  }

  User loadUser(SharedPreferences prefs) {
    String email = prefs.getString(kPrefUserEmail)!;
    int userId = prefs.getInt(kPrefUserId)!;
    String firstName = prefs.getString(kPrefUserFirstName)!;
    String lastName = prefs.getString(kPrefUserLastName)!;

    return User(
        id: userId, email: email, firstName: firstName, lastName: lastName);
  }

  void clearPrefs(SharedPreferences prefs) {
    prefs.remove(kPrefUserEmail);
    prefs.remove(kPrefUserId);
    prefs.remove(kPrefUserFirstName);
    prefs.remove(kPrefUserLastName);
    prefs.remove(kPrefJwt);
  }

  void printPrefs(SharedPreferences prefs) {
    if (kDebugMode) {
      print('User email: ${prefs.getString(kPrefUserEmail)}');
      print('User id: ${prefs.getInt(kPrefUserId)}');
      print('User name: ${prefs.getString(kPrefUserFirstName)}');
      print('User last name: ${prefs.getString(kPrefUserLastName)}');
      print('JWT: ${prefs.getString(kPrefJwt)}');
    }
  }
}
