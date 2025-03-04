import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/models/requets/user_reauest.dart';

abstract class AuthServiceNetwork {
  Future<User?> login(String email, String password);
  Future<User?> register(User user, String password);
  Future<bool> verifyEmail(String email);
  Future<bool> changePassword(int opt);
  Future<dynamic> newUser(String nom, String email);
}
