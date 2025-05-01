import 'package:get/get.dart';
import 'package:jenos_app/api/network/acceuil_service_network_impl.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/views/pages/plats/search/search_page_state.dart';

class SearchPageCtrl extends GetxController {
  var state = SearchPageState().obs;

  void onInit() async {
    var args = Get.arguments;
    state.update((val) {
      val?.isVisible = false;
      val?.hasData = false;
      val?.loading = true;
      val?.noGet = false;
      val?.autoFocus = args['auto_focus'] == 1;
    });
    AcceuilServiceNetworkImpl api = AcceuilServiceNetworkImpl();
    List<Plat> plats = await api.plats();
    state.update((val) {
      val?.plats = plats;
      val?.isVisible = (plats.isNotEmpty) ? true : false;
      val?.hasData = (plats.isNotEmpty) ? true : false;
      val?.loading = false;
    });

    super.onInit();
  }

  void search(String search) async {
    state.update((val) {
      val?.plats = [];
      val?.isVisible = false;
      val?.hasData = false;
      val?.loading = true;
    });

    AcceuilServiceNetworkImpl api = AcceuilServiceNetworkImpl();
    List<Plat> plats = await api.recherchePlats(search);
    state.update((val) {
      val?.search = search;
      val?.plats = plats;
      val?.isVisible = (plats.isNotEmpty) ? true : false;
      val?.hasData = (plats.isNotEmpty) ? true : false;
      val?.loading = false;
      val?.noGet = (plats.isEmpty) ? true : false;
    });
  }
}
