import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/notification.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/network/auth_service_network.dart';
import 'package:http/http.dart' as http;

class AuthServiceNetworkImpl implements AuthServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  @override
  Future<User?> login(String email, String password) async {
    try {
      var url = Uri.parse("${baseUrl}login");
      var response =
          await http.post(url, body: {"email": email, "password": password});

      Map<String, dynamic> res = json.decode(response.body);
      return User.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> register(User user, String password) async {
    try {
      var url = Uri.parse("${baseUrl}clients");
      var response = await http.post(url, body: {
        "nom": user.nom,
        "prenom": user.prenom,
        "email": user.email,
        "phone": user.phone,
        "password": password,
      });

      Map<String, dynamic> res = json.decode(response.body);
      return User.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<int?> verifyEmail(String email) async {
    try {
      var url = Uri.parse("${baseUrl}check-mail");
      var response = await http.post(url, body: {"email": email});
      Map<String, dynamic> res = json.decode(response.body);
      int code = res['code'].toInt();
      return code;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> changePassword(String password, String email) async {
    try {
      var url = Uri.parse("${baseUrl}update-password");
      var response =
          await http.post(url, body: {"email": email, "password": password});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<dynamic> newUser(String nom, String email) async {
    try {
      var url = Uri.parse("${baseUrl}new-client");
      var response = await http.post(url, body: {'nom': nom, 'email': email});

      Map<String, dynamic> res = json.decode(response.body);

      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> updateUser(User user) async {
    try {
      var url = Uri.parse("${baseUrl}clients/${user.id.toString()}");
      var response = await http.put(url,
          body: {"nom": user.nom, "prenom": user.prenom, "phone": user.phone});

      Map<String, dynamic> res = json.decode(response.body);

      return User.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  Future<List<Notification>> getNotifications(int id) async {
    List<Notification> notifications = [];
    try {
      var url = Uri.parse("${baseUrl}notifications/${id.toString()}");
      var response = await http.get(url);
      List<dynamic> res = json.decode(response.body);
      notifications = res.map((item) => Notification.fromJson(item)).toList();
      return notifications;
    } catch (e) {
      return notifications;
    }
  }
}
