import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/controllers/acceuil/profile/profile_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';

class ProfileCtrl extends GetxController {
  var state = ProfilePageState().obs;

  void getUser() async{
    AuthServiceLocalImpl api = AuthServiceLocalImpl();

    User? user = await api.getUser();

    state.update((val){
      user = user;
    });
  }

  void edit() {
    if (state.value.edit == true) {
      state.update((val) {
        val?.edit = false;
      });
    } else {
      state.update((val) {
        val?.edit = true;
      });
    }
  }

  void signOut() async {
    AuthServiceLocalImpl api = AuthServiceLocalImpl();
    bool signOut = api.signOut();
    if (signOut) {
      MyAlert.show(text: "Vous êtes maintenant déconnecté.", bg: Colors.black54);
     // Get.toNamed('/login');
    }
  }
}
