import 'package:get/get.dart';
import 'package:jenos_app/views/pages/auth/forget_password.dart';
import 'package:jenos_app/views/pages/auth/new_password.dart';
import 'package:jenos_app/views/pages/auth/register_page.dart';
import 'package:jenos_app/views/pages/auth/verify_otp.dart';
import 'package:jenos_app/views/pages/intro/access_page.dart';

import '../views/pages/auth/login_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/forget-password', page: () => const ForgetPassword()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/otp', page: () => const VerifyOtp()),
    GetPage(name: '/new-password', page: () => const NewPassword()),
    GetPage(name: '/', page: () => const AccessPage())
  ];
}
