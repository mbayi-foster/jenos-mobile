import 'dart:convert';
import 'package:jenos_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';

import 'package:jenos_app/views/components/my_alert.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigureAdressePageCtrl extends GetxController {
  var state = ConfigureAdressePageState().obs;

  @override
  onInit() {
    final args = Get.arguments;
    if (args == null || !args.containsKey('location')) {
      state.value.place = Place(lat: -4.322693, long: 15.271774);
    } else {
      state.update((val) {
        val?.place = args['location'];
      });
      print("arguments : ${state.value.place!.toJson()}");
    }
    String previousRoute = Get.previousRoute;
    print("La route précédente est : $previousRoute");
    if (previousRoute == '/checkout') {
      state.value.last = 2;
    }
    super.onInit();
  }

/* changer de localisation */
  void changeLocalisation({required double lat, required double long}) {
    state.update((val) {
      val?.place = Place(lat: lat, long: long);
    });
    _getNamePlace(lat, long);
  }

  /* recuperer sa position */
  Future<bool> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition();
      state.update((val) {
        val?.place = Place(lat: position.latitude, long: position.longitude);
      });
      _getNamePlace(position.latitude, position.longitude);
      return true;
    }
    state.update((val) {
      val?.loading = false;
    });
    return false;
    // return Place(lat: -4.322693, long: 15.271774, nom: "default");
  }

  /* recuperer le nom du lieu */
  void _getNamePlace(double lat, double long) async {
    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    Place? place = await api.getPlace(lat, long);
    state.update((val) {
      val?.place!.nom = place!.nom;
    });
  }

  void charger(Place? place, BuildContext ctx) async {
    ctx.loaderOverlay.show();
    if (state.value.last == 1) {
      /* traitement pour la page precedente profile */
      AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
      User? userLocal = await apiUser.getUser();
      LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
      User? user = await api.changeAdresse(
          Place(lat: place!.lat, long: place.long, nom: place.nom),
          userLocal!.id);

      if (user != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        if (ctx.mounted) {
          ctx.loaderOverlay.hide();
        }
        MyAlert.show(text: "Adresse configurée avec succès", bg: Colors.green);
        Get.offNamed('/profile');
      }
    } else {
      /* page precedente commande */
      // Dans la page où vous souhaitez revenir
      Get.back(result: {'adresse': "ceci est l'adresse"});
      print('route precente checkout');
    }
    if (ctx.mounted) {
      ctx.loaderOverlay.hide();
    }
  }
}
