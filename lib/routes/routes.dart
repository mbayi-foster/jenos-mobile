import 'package:get/get.dart';
import 'package:jenos_app/views/pages/acceuil/home_page.dart';
import 'package:jenos_app/views/pages/acceuil/menu_page.dart';
import 'package:jenos_app/views/pages/acceuil/more_page.dart';
import 'package:jenos_app/views/pages/acceuil/offre_page.dart';
import 'package:jenos_app/views/pages/acceuil/profile_page.dart';
import 'package:jenos_app/views/pages/auth/forget_password.dart';
import 'package:jenos_app/views/pages/auth/new_password.dart';
import 'package:jenos_app/views/pages/auth/register_page.dart';
import 'package:jenos_app/views/pages/auth/verify_otp.dart';
import 'package:jenos_app/views/pages/details/details_menu_page.dart';
import 'package:jenos_app/views/pages/details/details_plat.dart';
import 'package:jenos_app/views/pages/intro/access_page.dart';
import 'package:jenos_app/views/pages/intro/info_page.dart';
import 'package:jenos_app/views/pages/intro/intro_page.dart';

import '../views/pages/auth/login_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/enter', page: () => const AccessPage()),
    GetPage(name: '/info-page', page: () => const InfoPage()),
    GetPage(name: '/forget-password', page: () => const ForgetPassword()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/otp', page: () => const VerifyOtp()),
    GetPage(name: '/new-password', page: () => const NewPassword()),
    GetPage(name: '/', page: () => const DetailsPlat()),
    GetPage(name: '/menus', page: () => const MenuPage()),
    GetPage(name: '/offres', page: () => const OffrePage()),
    GetPage(name: '/more', page: () => const MorePage()),
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(name: '/profile', page: () => const ProfilePage()),
  ];
}
