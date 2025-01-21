import 'package:jenos_app/models/principals/user.dart';

abstract class AuthServiceNetwork {
  Future<User> login(String email, String password);
}
