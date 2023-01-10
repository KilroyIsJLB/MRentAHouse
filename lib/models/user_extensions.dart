

import 'package:locations/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension UserExtensions on User {
  Future savePreferences(SharedPreferences prefs) async {
    prefs.setInt('RAH_id', id);
    prefs.setString('RAH_email', email);
    prefs.setString('RAH_pwd', password);
  }

  void loadPreferences(SharedPreferences prefs) {
    email = prefs.getString('RAH_email') ?? '-';
    if (email.isNotEmpty) {
      password = prefs.getString('RAH_pwd') ?? '';
      id = prefs.getInt('RAH_id') ?? 0;
    }
  }
}