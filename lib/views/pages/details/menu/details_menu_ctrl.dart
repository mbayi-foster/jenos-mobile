import 'package:get/get.dart';
import 'package:jenos_app/api/network/details_service_network_impl.dart';
import 'package:jenos_app/views/pages/details/menu/deatils_menu_state_page.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DetailsMenuCtrl extends GetxController {
  var state = DeatilsMenuStatePage().obs;

  void fetchData(String id) async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.menu = null;
      val?.visible = false;
      val?.plats = [];
    });

    DetailsServiceNetworkImpl api = DetailsServiceNetworkImpl();
    var data = await api.getMenu(id);

    if (data != null) {
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.menu = data;
        val?.visible = true;
        val?.plats = data.plats.cast<Plat>();
      });
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.menu = null;
        val?.visible = false;
        val?.plats = [];
      });
    }
  }
}
