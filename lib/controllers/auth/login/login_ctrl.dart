import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/controllers/auth/login/login_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';
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
      print("data : ${user.toJson()}");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));
      state.update((val) {
        val?.loading = false;
        val?.error = false;
      });
      Get.toNamed("/home");
    } else {
      state.update((val) {
        val?.loading = false;
        val?.error = true;
      });
    }
    /*   state = state.copyWith(loading: true);
    update();
    AuthServiceNetworkImpl ctrl = AuthServiceNetworkImpl();
    User? user = await ctrl.login(email, password);
    print("$email & $password");
    Timer(const Duration(seconds: 5), () {
      if (user != null) {
        state = state.copyWith(loading: false, error: false);
        update();
        Get.toNamed("/home");
      } else {
        state = state.copyWith(loading: false, error: true);
        update();
      }
    }); */
  }
}
