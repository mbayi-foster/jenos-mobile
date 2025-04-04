import 'package:get/get.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';

class ConfigureAdressePageCtrl extends GetxController {
  var state = ConfigureAdressePageState().obs;

  void changeLocalisation({required double lat, required double long}) {
    state.update((val) {
      val?.lat = lat;
      val?.long = long;
    });
  }
}
