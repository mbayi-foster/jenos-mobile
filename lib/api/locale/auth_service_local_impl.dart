import 'dart:convert';

import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/locale/auth_service_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceLocalImpl extends AuthServiceLocal {
  @override
  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userStore = prefs.getString('user');

    if (userStore != null) {
      Map<String, dynamic> userMap = jsonDecode(userStore);
      return User.fromJson(userMap);
    }

    return null;
  }

  @override
  Future<bool> verifyOtp(int code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? codeStore = prefs.getInt('code');

    if (codeStore != null && codeStore == code) {
      return true;
    } else {
      return false;
    }
  }
}
