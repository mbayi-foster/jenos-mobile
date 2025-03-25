import 'package:get/get.dart';
import 'package:jenos_app/routes/middlewares/middleware_auth.dart';
import 'package:jenos_app/views/pages/acceuil/home/home_page.dart';
import 'package:jenos_app/views/pages/acceuil/menu/menu_page.dart';
import 'package:jenos_app/views/pages/acceuil/more_page/more_page.dart';
import 'package:jenos_app/views/pages/acceuil/offre_page/offre_page.dart';
import 'package:jenos_app/views/pages/acceuil/profile/profile_page.dart';
import 'package:jenos_app/views/pages/auth/forget_password/forget_password.dart';
import 'package:jenos_app/views/pages/auth/new_password/new_password.dart';
import 'package:jenos_app/views/pages/auth/register/register_page.dart';
import 'package:jenos_app/views/pages/auth/otp/verify_otp.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commade.dart';
import 'package:jenos_app/views/pages/commandes/panier_achat/panier_achat.dart';
import 'package:jenos_app/views/pages/details/menu/details_menu_page.dart';
import 'package:jenos_app/views/pages/details/plat/details_plat.dart';
import 'package:jenos_app/views/pages/intro/access_page.dart';
import 'package:jenos_app/views/pages/intro/info_page.dart';
import 'package:jenos_app/views/pages/intro/intro_page.dart';
import 'package:jenos_app/views/pages/notifications/notifications_pages/notifications_page.dart';

import '../views/pages/auth/login/login_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';

  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(name: '/otp', page: () => const VerifyOtp()),
    GetPage(name: '/new-password', page: () => const NewPassword()),
    GetPage(name: '/forget-password', page: () => const ForgetPassword()),
    GetPage(
      name: '/enter',
      page: () => const AccessPage(),
    ),

    GetPage(
      name: '/info-page',
      page: () => const InfoPage(),
    ),
    GetPage(name: '/', page: () => const IntroPage()),

//routes protegés
    //Route acceuil
    GetPage(name: '/menus', page: () => const MenuPage(), middlewares: [
      MiddlewareAuth(),
    ]),
    GetPage(name: '/offres', page: () => const OffrePage(), middlewares: [
      MiddlewareAuth(),
    ]),
    GetPage(name: '/more', page: () => const MorePage(), middlewares: [
      MiddlewareAuth(),
    ]),
    GetPage(
        name: '/home',
        page: () => const HomePage(),
        middlewares: [MiddlewareAuth()]),
    GetPage(name: '/profile', page: () => const ProfilePage(), middlewares: [
      MiddlewareAuth(),
    ]),
    //fin routes acceuil
    GetPage(
        name: '/commande',
        page: () => const MaCommade(),
        middlewares: [MiddlewareAuth()]),

    //routes details
    GetPage(
        name: '/plat/:id',
        page: () => const DetailsPlat(),
        middlewares: [MiddlewareAuth()]),
    GetPage(
        name: '/menu/:id',
        page: () => const DetailsMenuPage(),
        middlewares: [MiddlewareAuth()]),

    //routes commandes
    GetPage(
        name: '/panier',
        page: () => const PanierAchat(),
        middlewares: [MiddlewareAuth()]),

    //route info
    GetPage(
        name: '/notifications',
        page: () => const NotificationsPage(),
        middlewares: [MiddlewareAuth()]),
  ];
}
