import 'dart:convert';

import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/controllers/auth/otp/otp_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpCtrl extends GetxController {
  var state = OtpState().obs;

  void checkOtp(int code) async {
    state.update((val) {
      val?.loading = true;
      val?.error = false;
    });
    AuthServiceLocalImpl apiLocal = AuthServiceLocalImpl();
    AuthServiceNetworkImpl apiNetwork = AuthServiceNetworkImpl();

    bool check = await apiLocal.verifyOtp(code);

    if (check) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userStore = prefs.getString('user');

      if (userStore != null) {
        Map<String, dynamic> userMap = jsonDecode(userStore);
        User user = User.fromJson(userMap);
        print("data : ${user.toJson()}");

        var data = await apiNetwork.register(user);

        if (data != null) {
          state.update((val) {
            val?.loading = false;
            val?.error = false;
          });
          Get.toNamed('/home');
        } else {
          state.update((val) {
            val?.loading = false;
            val?.error = true;
            val?.msg =
                "Une erreur s'est produite chechez votre connection et réessayé";
          });
        }
      } else {
        state.update((val) {
          val?.loading = false;
          val?.error = true;
          val?.msg =
              "Excusez nous pour ce petit désagréement viellez rédemarrer l'application et récommencez";
        });
      }
    } else {
      state.update((val) {
        val?.loading = false;
        val?.error = true;
        val?.msg =
            "Vous avez entré le mauvais code si vous n'avez pas réussi des code cliqué sur renvoyer";
      });
    }
  }
}
