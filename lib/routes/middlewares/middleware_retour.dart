import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddlewareRetour extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    String? currentRoute = Get.currentRoute;

    print("La route dans le middlware est $currentRoute ");
    // Vérifiez la route actuelle
    if (currentRoute == '/profile' ||
        currentRoute == '/menus' ||
        currentRoute == '/offres' ||
        currentRoute == '/more') {
      // Redirigez vers la route spécifique si l'utilisateur essaie de revenir
      return RouteSettings(
          name: '/home'); // Remplacez '/home' par la route souhaitée
    }
    return null; // Permet l'accès à la route
  }
}
