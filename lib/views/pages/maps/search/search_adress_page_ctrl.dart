import 'package:get/get.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/views/pages/maps/search/search_adress_page_state.dart';

class SearchAdressPageCtrl extends GetxController {
  var state = SearchAdressPageState().obs;

  @override
  onInit() {
    state.value.loading = false;
    state.value.hasData = "not_yet";
    state.value.places = [];
    super.onInit();
  }

/* recherches par nom */
  void search(String name) async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = "en_cours";
    });
    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    List<Place> places = await api.searchPlaces(name);

    state.update((val) {
      val?.loading = false;
      if (places.isNotEmpty) {
        val?.hasData = "okay";
      } else {
        val?.hasData = "not";
      }
      val?.places = places;
    });
  }

  void checkPlace(double lat, double long) async {
    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    Place? place = await api.getPlace(lat, long);
    state.update((val) {
      //val?.place = place;
    });
  }
}
