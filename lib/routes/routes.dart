import 'package:get/get.dart';
import 'package:jenos_app/routes/middlewares/middleware_auth.dart';
import 'package:jenos_app/routes/middlewares/middleware_retour.dart';
import 'package:jenos_app/views/pages/acceuil/home_page.dart';
import 'package:jenos_app/views/pages/acceuil/menu_page.dart';
import 'package:jenos_app/views/pages/acceuil/more_page.dart';
import 'package:jenos_app/views/pages/acceuil/offre_page.dart';
import 'package:jenos_app/views/pages/acceuil/profile_page.dart';
import 'package:jenos_app/views/pages/auth/forget_password.dart';
import 'package:jenos_app/views/pages/auth/new_password.dart';
import 'package:jenos_app/views/pages/auth/register_page.dart';
import 'package:jenos_app/views/pages/auth/verify_otp.dart';
import 'package:jenos_app/views/pages/commandes/ma_commade.dart';
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
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/otp', page: () => const VerifyOtp()),
    GetPage(name: '/new-password', page: () => const NewPassword()),
    GetPage(name: '/forget-password', page: () => const ForgetPassword()),

    //routes protegés
    GetPage(
        name: '/enter',
        page: () => const AccessPage(),
        middlewares: [MiddlewareAuth()]),
    GetPage(
        name: '/info-page',
        page: () => const InfoPage(),
        middlewares: [MiddlewareAuth()]),
    GetPage(name: '/', page: () => const IntroPage()),

//Route acceuil
    GetPage(
        name: '/menus',
        page: () => const MenuPage(),
        middlewares: [MiddlewareAuth(), MiddlewareRetour()]),
    GetPage(
        name: '/offres',
        page: () => const OffrePage(),
        middlewares: [MiddlewareAuth(), MiddlewareRetour()]),
    GetPage(
        name: '/more',
        page: () => const MorePage(),
        middlewares: [MiddlewareAuth(), MiddlewareRetour()]),
    GetPage(
        name: '/home',
        page: () => const HomePage(),
        middlewares: [MiddlewareAuth()]),
    GetPage(
        name: '/profile',
        page: () => const ProfilePage(),
        middlewares: [MiddlewareAuth(), MiddlewareRetour()]),
    //fin routes acceuil
    GetPage(
        name: '/commande',
        page: () => const MaCommade(),
        middlewares: [MiddlewareAuth()]),

    //routes details
    GetPage(
        name: '/plat/:id',
        page: () => const DetailsPlat(),
        middlewares: [MiddlewareAuth()])
  ];
}
