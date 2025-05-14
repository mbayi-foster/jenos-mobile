import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:jenos_app/views/pages/auth/new_password/new_password_state.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/models/principals/user.dart';

class NewPasswordCtrl extends GetxController {
  var state = NewPasswordState().obs;
  @override
  onInit() async {
    final args = Get.arguments;
    if (args != null && args!.containsKey('email')) {
      state.update((val) {
        val?.email = args['email'];
        val?.lastPage = 1;
      });
    } else {
      AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
      User? user = await apiUser.getUser();
      state.update((val) {
        val?.email = user!.email;
        val?.lastPage = 0;
      });
    }
    super.onInit();
  }

  void changePasseword(BuildContext ctx, String password) async {
    print('mot de passe $password && ${state.value.email}');
    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();
    bool changePassword = await api.changePassword(password, state.value.email);
    if (changePassword) {
      if (state.value.lastPage == 0) {
          Get.back();
      }else{
        Get.offNamed('/login');
      }
    } else {
      MyAlert.show(text: 'Erreur!', bg: Colors.red);
    }
  }

  void showPassword() {
    state.update((val) {
      val?.password = (state.value.password) ? false : true;
    });
  }
}
