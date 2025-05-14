import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/auth/forget_password/forget_password_state.dart';
import 'package:jenos_app/views/pages/auth/new_password/new_password.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordCtrl extends GetxController {
  var state = ForgetPasswordState().obs;
  void send(String email, BuildContext context) async {
    state.update((val) {
      val?.error = false;
      val?.done = false;
      val?.loading = false;
    });
    context.loaderOverlay.show();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();
    int? code = await api.verifyEmail(email);
    if (code != null) {
      await prefs.setInt('code', code);
      await prefs.setString('email', email);
      state.update((val) {
        val?.error = false;
        val?.done = true;
        val?.loading = false;
        Get.toNamed('/otp', arguments: {"page": "forget-password"});
      });
    } else {
      state.update((val) {
        val?.error = true;
        val?.done = false;
        val?.loading = false;
      });
    }
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
  }
}
