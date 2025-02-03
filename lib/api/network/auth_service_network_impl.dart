import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/models/requets/user_reauest.dart';
import 'package:jenos_app/services/auth_service_network.dart';

class AuthServiceNetworkImpl implements AuthServiceNetwork {
  @override
  Future<User?> login(String email, String password) async {
    User user = User(
        id: 1,
        nom: "Kalala",
        email: "mbayifoster@gmail.com",
        prenom: "Foster",
        phone: "0998115482",
        status: true,
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
  Future<bool> verifyOtp(int opt) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
