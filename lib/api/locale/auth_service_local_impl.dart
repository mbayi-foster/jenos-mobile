import 'dart:convert';

import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/locale/auth_service_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceLocalImpl extends AuthServiceLocal {
  static final AuthServiceLocalImpl _instance =
      AuthServiceLocalImpl._internal();
  SharedPreferences? _prefs;

  factory AuthServiceLocalImpl() {
    return _instance;
  }

  AuthServiceLocalImpl._internal();
  @override
  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ;
    String? userStore = prefs.getString('user');
    if (userStore != null) {
      Map<String, dynamic> userMap = jsonDecode(userStore);
      User user = User.fromJson(userMap);
      return user;
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

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  bool isAuthenticated() {
    String? userStore = _prefs?.getString('user');

    if (userStore != null) {
      return true;
    }

    return false;
  }

  @override
  bool signOut() {
    if (_prefs?.remove('user') != null) {
      return true;
    } else {
      return false;
    }
  }
}
