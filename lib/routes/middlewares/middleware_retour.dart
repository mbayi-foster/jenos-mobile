import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddlewareRetour extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("La route dans le middlware est $route");
    // Vérifiez la route actuelle
    if (route == '/profile' ||
        route == '/menus' ||
        route == '/offres' ||
        route == '/more') {
      // Redirigez vers la route spécifique si l'utilisateur essaie de revenir
      return RouteSettings(
          name: '/home'); // Remplacez '/home' par la route souhaitée
    }
    return null; // Permet l'accès à la route
  }
}
