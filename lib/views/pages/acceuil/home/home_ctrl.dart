import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/acceuil_service_network_impl.dart';
import 'package:jenos_app/models/principals/menu.dart';
import 'package:jenos_app/views/pages/acceuil/home/home_page_state.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/models/principals/user.dart';

class HomeCtrl extends GetxController {
  var state = HomePageState().obs;

  void fetchData() async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.visible = false;
    });
    AcceuilServiceNetworkImpl api = AcceuilServiceNetworkImpl();
    var data = await api.home();
    //print("data : $data");
    if (data != null) {
      List<dynamic> platsRecents = data['plat_recents'];
      List<dynamic> platsPops = data['plat_pops'];
      List<dynamic> platsMostPops = data['plat_most_pops'];
      List<dynamic> menusData = data['menus'];

      if (platsMostPops.isNotEmpty &&
          platsPops.isNotEmpty &&
          platsRecents.isNotEmpty &&
          menusData.isNotEmpty) {
        List<Plat> recents =
            platsRecents.map((plat) => Plat.fromJson(plat)).toList();
        List<Plat> pops = platsPops.map((plat) => Plat.fromJson(plat)).toList();
        List<Plat> mostPops =
            platsMostPops.map((plat) => Plat.fromJson(plat)).toList();
        List<Menu> menus =
            menusData.map((menu) => Menu.fromJson(menu)).toList();
        state.update((val) {
          val?.loading = false;
          val?.hasData = true;
          val?.visible = true;
          val?.platRecents = recents;
          val?.platPops = pops;
          val?.platMostPops = mostPops;
          val?.menus = menus;
        });
      } else {
        state.update((val) {
          val?.loading = false;
          val?.hasData = false;
          val?.visible = false;
          val?.platRecents = const [];
          val?.platPops = const [];
          val?.platMostPops = const [];
        });
      }
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.visible = false;
        val?.platRecents = const [];
        val?.platPops = const [];
        val?.platMostPops = const [];
      });
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
