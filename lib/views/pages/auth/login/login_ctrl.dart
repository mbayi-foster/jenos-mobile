import 'dart:convert';

import 'package:get/get.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:jenos_app/views/pages/auth/login/login_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCtrl extends GetxController {
  var state = LoginPageState().obs;

  void login(String email, String password) async {
    //  print("$email & $password");
    state.update((val) {
      val?.loading = true;
    });
    AuthServiceNetworkImpl ctrl = AuthServiceNetworkImpl();
    User? user = await ctrl.login(email, password);

    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));
      state.update((val) {
        val?.loading = false;
        val?.error = false;
      });
      Get.offAllNamed("/home");
    } else {
      state.update((val) {
        val?.loading = false;
        val?.error = true;
      });
      MyAlert.show(text: "Email ou mot de passe incorrecte");
    }
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
