import 'package:get/get.dart';
import 'package:jenos_app/api/network/acceuil_service_network_impl.dart';
import 'package:jenos_app/views/pages/acceuil/menu/menu_page_state.dart';
import 'package:jenos_app/models/principals/menu.dart';

class MenuPageCtrl extends GetxController {
  var state = MenuPageState().obs;

  void fetchData() async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.visible = false;
      val?.menus = [];
    });

    AcceuilServiceNetworkImpl api = AcceuilServiceNetworkImpl();
    List<Menu>? menus = await api.getMenus();

    if (menus != null && menus.isNotEmpty) {
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.visible = true;
        val?.menus = menus;
      });
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.visible = false;
        val?.menus = [];
      });
    }
  }
}
