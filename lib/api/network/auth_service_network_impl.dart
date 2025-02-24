import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/models/requets/user_reauest.dart';
import 'package:jenos_app/services/auth_service_network.dart';
import 'package:http/http.dart' as http;

class AuthServiceNetworkImpl implements AuthServiceNetwork {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  @override
  Future<User?> login(String email, String password) async {
    var url = Uri.parse("$baseUrl/login");
    var response =
        await http.post(url, body: {"email": email, "password": password});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    User user = User(
        id: 1,
        nom: "Kalala",
        email: "mbayifoster@gmail.com",
        prenom: "Foster",
        phone: "0998115482",
        photo: "",
        createdAt: DateTime.now());

    if (email == "mbayifoster@gmail.com" && password == "123456") {
      return user;
    } else {
      return null;
    }
  }

  @override
  Future<bool> register(UserRequest user) {
    // TODO: implement register
    throw UnimplementedError();
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
}
