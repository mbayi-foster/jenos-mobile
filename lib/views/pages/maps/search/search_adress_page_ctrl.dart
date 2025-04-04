import 'package:get/get.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/views/pages/maps/search/search_adress_page_state.dart';

class SearchAdressPageCtrl extends GetxController {
  var state = SearchAdressPageState().obs;

/* recherches par nom */
  void search(String name) async {
    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    List<Place> places = await api.getPlaces(name);

    state.update((val) {
      val?.places = places;
    });
  }
}
