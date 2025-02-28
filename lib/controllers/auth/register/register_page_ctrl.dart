import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/controllers/auth/register/register_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPageCtrl extends GetxController {
  var state = RegisterPageState().obs;

  Future<void> sendData(User user, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(
        "l'utilisateur est ${user.toJson()} et le mot de passe est $password");
    /* state.update((val) {
      val?.loading = true;
      val?.user = user;
    });
    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();
    var data = await api.newUser(user.nom, user.email);

    if (data != null) {
      bool keyExists = data.any((item) => item.containsKey("code"));

      if (keyExists) {
        String code = data['code'];
        String userJson = jsonEncode(user.toJson());
        await prefs.setString('user', userJson);
        await prefs.setString('code', code);
        Get.toNamed('/otp');
      } else {
        String msg = data['msg'];
        await prefs.setString('email', user.email);
        state.update((val) {
          val?.error = true;
          val?.loading = false;
          val?.user = null;
          val?.code = 0;
          val?.msg = msg;
        });
      }
    } else {
      state.update((val) {
        val?.error = true;
        val?.loading = false;
        val?.user = null;
        val?.code = 0;
        val?.msg =
            "Une erreur s'est produite vérifier votre connexion internet et réessayez";
      });
    }*/
  }

  void showPassword() {
    if (state.value.showPassword) {
      state.update((val) {
        val?.showPassword = false;
      });
    } else {
      state.update((val) {
        val?.showPassword = true;
      });
    }
  }
}
