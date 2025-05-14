import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/api/network/panier_service_network_impl.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/models/requets/commande_request.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_state.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CheckoutPageCtrl extends GetxController {
  var state = CheckoutPageState().obs;

  @override
  void onInit() async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.isVisible = false;
    });
    // Récupérer les arguments et les assigner à l'observable
    var args = Get.arguments;
    AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
    User? user = await apiUser.getUser();
    Place? userPlace = user!.adresse;
    // if (userPlace != null) {
    //   state.update((val) {
    //     val?.adresse = userPlace;

    //   });
    // }
    LocalisationServiceNetworkImpl apiCommunes =
        LocalisationServiceNetworkImpl();
    List<Commune> communes = await apiCommunes.getCommune();
    if (communes.isNotEmpty && userPlace != null) {
      Commune commune = communes.firstWhere(
        (item) => item.nom == userPlace.commune,
        orElse: () =>
            Commune(id: 0, nom: userPlace.commune ?? "", zone: "", frais: 0),
      );
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.communes = communes;
        val?.commune = commune;
        val?.isVisible = true;
        val?.adresse = Place(
            nom: userPlace.nom,
            commune: commune.nom,
            lat: userPlace.lat,
            long: userPlace.long);
        val?.user = user;
        val?.deliveryCoast = commune.frais;
        val?.prix = args['prix'] ?? 0.0;
        val?.paniers = args['paniers'];
        val?.note = args['note'] ?? "";
      });
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.isVisible = false;
      });
    }

    super.onInit();
  }

  // changement methode de paiement
  void changePaiement(String type) {
    state.update((val) {
      val?.paiement = type;
    });
  }

  void navigateToDestination() async {
    final returnedResult = await Get.to(() => ConfigureAdressePage());
    if (returnedResult != null) {
      Place? place = returnedResult['place'];
      Commune commune = state.value.communes.firstWhere(
        (item) => item.nom == place!.commune,
        orElse: () =>
            Commune(id: 0, nom: place?.commune ?? "", zone: "", frais: 0),
      );
      state.update((val) {
        val?.adresse = place;
        val?.deliveryCoast = commune.frais;
      });
    }
  }

  // void getUser() async {
  //   AuthServiceLocalImpl api = AuthServiceLocalImpl();

  //   User? user = await api.getUser();

  //   state.update((val) {
  //     val?.user = user;
  //   });
  // }

  /* chechout */
  Future<bool> payer(BuildContext ctx) async {
    ctx.loaderOverlay.show();
    CommandeRequest commande = CommandeRequest(
        clientId: state.value.user?.id ?? 0,
        prix: state.value.prix,
        deliveryCoast: state.value.deliveryCoast,
        paiement: state.value.paiement,
        adresse: state.value.adresse!,
        paniers: state.value.paniers,
        facture: false,
        zone: state.value.commune!.zone,
        note: state.value.note);
    PanierServiceNetworkImpl api = PanierServiceNetworkImpl();
    bool payer = await api.commander(commande);
    print('commande ${commande.toJson()}');
    if (ctx.mounted) {
      ctx.loaderOverlay.hide();
    }
    return payer;
  }
}
