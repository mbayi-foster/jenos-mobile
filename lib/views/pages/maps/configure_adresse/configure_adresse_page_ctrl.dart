import 'package:get/get.dart';
import 'package:jenos_app/api/network/localisation_service_network_impl.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_state.dart';

import 'package:geolocator/geolocator.dart';

class ConfigureAdressePageCtrl extends GetxController {
  var state = ConfigureAdressePageState().obs;

  @override
  onInit() {
    state.value.place = Place(lat: -4.322693, long: 15.271774, nom: "default");
    super.onInit();
  }

/* changer de localisation */
  void changeLocalisation({required double lat, required double long}) {
    state.update((val) {
      val?.place!.lat = lat;
      val?.place!.long = long;
    });
  }

  /* recuperer sa position */
  Future<Place> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Place(lat: position.latitude, long: position.longitude);
    }
    return Place(lat: -4.322693, long: 15.271774, nom: "default");
  }

  /* recuperer le nom du lieu */
  void getNamePlace(double lat, double long) async {
    LocalisationServiceNetworkImpl api = LocalisationServiceNetworkImpl();
    Place? place = await api.getPlace(lat, long);
    state.update((val) {
      val?.place = place;
    });
  }
  /*  Future<String> _getNomLieu(double lat, double lng) async {
   // var response = await http.get(getRouteUrl2(lat, lng));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("Nom : " + data['display_name']);
      return data['display_name'];
    }

    return 'Not found';
  } */
}
