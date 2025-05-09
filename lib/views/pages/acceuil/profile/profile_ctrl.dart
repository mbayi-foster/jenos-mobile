import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/pages/acceuil/profile/profile_page_state.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCtrl extends GetxController {
  var state = ProfilePageState().obs;

  void getUser() async {
    state.update((val) {
      val?.isLoad = true;
      val?.hasData = false;
      val?.isVisible = false;
    });
    AuthServiceLocalImpl api = AuthServiceLocalImpl();
    LocalisationServiceNetworkImpl apiCommunes =
        LocalisationServiceNetworkImpl();
    List<Commune> communes = await apiCommunes.getCommune();
    User? user = await api.getUser();
    if (user != null && communes.isNotEmpty) {
      state.update((val) {
        val?.user = user;
        val?.communes = communes;
        val?.isLoad = false;
        val?.hasData = true;
        val?.isVisible = true;
      });
    } else {
      state.update((val) {
        val?.user = user;
        val?.communes = communes;
        val?.isLoad = false;
        val?.hasData = false;
        val?.isVisible = false;
      });
    }
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
      MyAlert.show(
          text: "Vous êtes maintenant déconnecté.", bg: Colors.black54);
      Get.offAllNamed('/login');
    }
  }

/* changer l'adresse */
  void changerAdresse(Place? place, BuildContext ctx) async {
    ctx.loaderOverlay.show();

    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    User? user = await api.changeAdresse(
        Place(
            lat: place!.lat,
            long: place.long,
            nom: place.nom,
            commune: place!.commune),
        state.value.user!.id);

    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));

      if (ctx.mounted) {
        ctx.loaderOverlay.hide();
        Navigator.of(ctx).pop();
      }
      MyAlert.show(text: "Adresse configurée avec succès", bg: Colors.green);
    }

    if (ctx.mounted) {
      ctx.loaderOverlay.hide();
    }
  }

  /* mis à jour de l'utilisateur */
  void updateUser(
      String nom, String prenom, String phone, BuildContext ctx) async {
    ctx.loaderOverlay.show();
    AuthServiceNetworkImpl api = AuthServiceNetworkImpl();

    User? userLocal = state.value.user!;

    userLocal.nom = nom;
    userLocal.prenom = prenom;
    userLocal.phone = phone;
    User? user = await api.updateUser(userLocal);

    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));

      if (ctx.mounted) {
        ctx.loaderOverlay.hide();
        Get.reload();
        //   Navigator.of(ctx).pop();
      }
      MyAlert.show(text: "Mis à jour réussié !", bg: Colors.green);
    }

    if (ctx.mounted) {
      ctx.loaderOverlay.hide();
    }
  }
}
