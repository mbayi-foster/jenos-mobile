import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/models/principals/user.dart';

class MiddlewareAuth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
   WidgetsFlutterBinding.ensureInitialized();
    AuthServiceLocalImpl userLocal = AuthServiceLocalImpl();
    bool? isAuthenticated =  userLocal.isAuthenticated();
 
    // Si l'utilisateur n'est pas authentifié, redirigez-le vers la page de connexion
    if (!isAuthenticated) {
      return RouteSettings(name: '/login');
    }
    return null;
  }
}
