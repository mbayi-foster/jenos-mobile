import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/services/network/auth_service_network.dart';
import 'package:http/http.dart' as http;

class AuthServiceNetworkImpl implements AuthServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  @override
  Future<User?> login(String email, String password) async {
    var url = Uri.parse("${baseUrl}login");
    var response =
        await http.post(url, body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      Map<String, dynamic> res = json.decode(response.body);
      return User.fromJson(res);
    }

    return null;
  }

  @override
  Future<User?> register(User user, String password) async {
    var url = Uri.parse("${baseUrl}clients");
    var response = await http.post(url, body: {
      "nom": user.nom,
      "prenom": user.prenom,
      "email": user.email,
      "phone": user.phone,
      "password": password,
    });
    if (response.statusCode == 201) {
      Map<String, dynamic> res = json.decode(response.body);
      return User.fromJson(res);
    }

    return null;
  }

  @override
  Future<bool> verifyEmail(String email) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> changePassword(int opt) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<dynamic> newUser(String nom, String email) async {
    var url = Uri.parse("${baseUrl}new-client");
    var response = await http.post(url, body: {'nom': nom, 'email': email});

    if (response.statusCode == 200) {
      Map<String, dynamic> res = json.decode(response.body);

      return res;
    }

    return null;
  }

  @override
  Future<User?> updateUser(User user) async {
    var url = Uri.parse("${baseUrl}clients/${user.id.toString()}");
    var response = await http.put(url,
        body: {"nom": user.nom, "prenom": user.prenom, "phone": user.phone});

    if (response.statusCode == 201) {
      Map<String, dynamic> res = json.decode(response.body);

      return User.fromJson(res);
    }
    return null;
  }


}
