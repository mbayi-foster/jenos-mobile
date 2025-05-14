import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/details_service_network_impl.dart';
import 'package:jenos_app/api/network/panier_service_network_impl.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/components/my_alert.dart';
import 'package:jenos_app/views/pages/details/plat/details_plat_page_state.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DetailsPlatCtrl extends GetxController {
  var state = DetailsPlatPageState().obs;

/* recuperation du plat */
  void getPlat(String id) async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.visible = false;
      val?.qte = 1;
      val?.plat = null;
      val?.traitement = false;
    });

    DetailsServiceNetworkImpl api = DetailsServiceNetworkImpl();

    var data = await api.getPlat(id);

    if (data != null) {
      Plat plat = Plat.fromJson(data as Map<String, dynamic>);
      double prix = state.value.qte * plat.prix;
      String prixArrondi = prix.toStringAsFixed(2);
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.visible = true;
        val?.plat = plat;
        val?.prix = double.parse(prixArrondi);
      });
      //print("le nom du plat est : $data");
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.visible = false;
        val?.plat = null;
      });
    }
  }

/* changment de la qte */
  void changeQte(bool plusOrMoins, double prix) {
    if (plusOrMoins) {
      state.update((val) {
        val?.qte++;
        double price = state.value.qte * prix;
        String prixArrondi = price.toStringAsFixed(2);
        val?.prix = double.parse(prixArrondi);
      });
    }
    if (!plusOrMoins && state.value.qte > 1) {
      state.update((val) {
        val?.qte--;
        double price = state.value.qte * prix;
        String prixArrondi = price.toStringAsFixed(2);
        val?.prix = double.parse(prixArrondi);
      });
    }

    // print("changement : ${state.value.qte} et valeur $plusOrMoins");
  }

/* function pour ajouter au panier */
  void addAtPanier() async {
    state.update((val) {
      val?.traitement = true;
    });

    PanierServiceNetworkImpl api = PanierServiceNetworkImpl();
    Map<String, dynamic> data = {
      "client_id": "${state.value.user?.id}",
      "plat_id": "${state.value.plat?.id}",
      "qte": "${state.value.qte}",
      "prix": "${state.value.prix}"
    };
    bool res = await api.ajouter(data);

    if (res) {
      state.update((val) {
        val?.traitement = false;
      });
      MyAlert.show(text: "Plat rajouté au panier !", bg: Colors.green);
      Get.offNamed("/panier");
    } else {
      state.update((val) {
        val?.traitement = false;
      });
      MyAlert.show(text: "Une erreur s'est produite veillez réessayer");
    }
  }

/* recuperation de l'utilisateur */
  void getUser() async {
    AuthServiceLocalImpl api = AuthServiceLocalImpl();

    User? user = await api.getUser();

    state.update((val) {
      val?.user = user;
    });
  }
}
