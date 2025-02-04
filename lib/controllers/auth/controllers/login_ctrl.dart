import 'dart:async';

import 'package:get/get.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/controllers/auth/states/login_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';

class LoginCtrl extends GetxController {
  LoginPageState state = LoginPageState();

  void login(String email, String password) async {
    state = state.copyWith(loading: true);
    update();
    AuthServiceNetworkImpl ctrl = AuthServiceNetworkImpl();
    User? user = await ctrl.login(email, password);
    print("$email & $password");
    Timer(Duration(seconds: 5), () {
      if (user != null) {
        state = state.copyWith(loading: false, error: false);
        update();
        Get.toNamed("/home");
      } else {
        state = state.copyWith(loading: false, error: true);
        update();
      }
    });
  }
}
