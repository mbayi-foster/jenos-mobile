import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/auth_service_network_impl.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/commune.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_state.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page.dart';

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
    print('arguments : $args');
    AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
    User? user = await apiUser.getUser();
    Place? userPlace = user!.adresse;
    if (userPlace != null) {
      LocalisationServiceNetworkImpl apiLocalisation =
          LocalisationServiceNetworkImpl();
      Place? place = await apiLocalisation.getPlace(
          userPlace.lat ?? 0.0, userPlace.long ?? 0.0);
      state.update((val) {
        val?.adresse = place;
      });
    }
    LocalisationServiceNetworkImpl apiCommunes = LocalisationServiceNetworkImpl();
    List<Commune> communes = await apiCommunes.getCommune();
    communes.forEach((item) {
      print('commune : ${item.nom}');
    });
    state.update((val) {
      val?.loading = false;
      val?.hasData = true;
      val?.isVisible = true;
      val?.user = user;
    });
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
      state.update((val) {
        val?.adresse = place;
      });
      print('commune ${place?.commune}');
    }
  }

  void getUser() async {
    AuthServiceLocalImpl api = AuthServiceLocalImpl();

    User? user = await api.getUser();

    state.update((val) {
      val?.user = user;
    });
  }
}
