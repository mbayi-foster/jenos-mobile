import 'package:jenos_app/models/principals/user.dart';

abstract class AuthServiceLocal{
  Future<bool> verifyOtp(int code);
  Future<User?> getUser();
}