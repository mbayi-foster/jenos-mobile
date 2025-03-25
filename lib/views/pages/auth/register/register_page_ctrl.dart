import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/views/pages/auth/register/register_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPageCtrl extends GetxController {
  var state = RegisterPageState().obs;

  Future<void> sendData(User user, String password) async {
   // print("utilisateur ${user.toJson()} et mot de passe $password");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state.update((val) {
      val?.loading = true;
      val?.user = user;
    });
    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();
    var data = await api.newUser(user.nom, user.email);

    if (data != null) {
    //  print("data : $data");

      if (data.containsKey("code")) {
      //  print("la clef existe et c'est ${data["code"]}");
        int code = data['code'];
        await prefs.setString('user', jsonEncode(user.toJson()));
        await prefs.setString('password', password);
        await prefs.setInt('code', code);
        state.update((val) {
          val?.error = false;
          val?.loading = false;
          val?.user = user;
          val?.code = code;
          val?.msg = "";
        });
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
           MyAlert.show(text: state.value.msg);
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
      MyAlert.show(text: state.value.msg,  time:4);
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
