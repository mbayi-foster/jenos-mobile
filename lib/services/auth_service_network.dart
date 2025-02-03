import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/models/requets/user_reauest.dart';

abstract class AuthServiceNetwork {
  Future<User?> login(String email, String password);
  Future<bool> register(UserRequest user);
  Future<bool> verifyEmail(String email);
  Future<bool> verifyOtp(int opt);
}
