import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/controllers/auth/otp/otp_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpCtrl extends GetxController {
  var state = OtpState().obs;

  void checkOtp(int code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state.update((val) {
      val?.loading = true;
      val?.error = false;
    });

    AuthServiceLocalImpl apiLocal = AuthServiceLocalImpl();
    AuthServiceNetworkImpl apiNetwork = AuthServiceNetworkImpl();

    bool check = await apiLocal.verifyOtp(code);
    String? userStore = prefs.getString('user');
    String? passwordStore = prefs.getString('password');
    if (check && userStore != null && passwordStore != null) {
      Map<String, dynamic> userMap = jsonDecode(userStore);
      User user = User.fromJson(userMap);
      // print("utilisateur : ${user.toJson()}");

      var data = await apiNetwork.register(user, passwordStore);
      if (data != null) {
        await prefs.setString('user', jsonEncode(data.toJson()));
        state.update((val) {
          val?.loading = false;
          val?.error = false;
          val?.msg = "Félicitations ! Bienvenue chez Jenos-Food";
        });
        MyAlert.show(text: state.value.msg, bg: Colors.green);
         Get.toNamed('/home');
      } else {
        state.update((val) {
          val?.loading = false;
          val?.error = true;
          val?.msg =
              "Une erreur s'est produite checkez votre connection et réessayé";
        });
        MyAlert.show(text: state.value.msg);
        Get.back();
      }
    } else {
      await Future.delayed(Duration(seconds: 2));
      state.update((val) {
        val?.loading = false;
        val?.error = true;
        val?.msg =
            "Vous avez entré le mauvais code si vous n'avez pas réussi des code cliqué sur renvoyer";
      });
      MyAlert.show(text: state.value.msg);
    }

/*         if (data != null) {
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
       else {
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
    } */
  }
}
