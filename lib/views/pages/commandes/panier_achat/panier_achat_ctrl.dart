import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/panier_service_network_impl.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/commandes/panier_achat/panier_achat_state.dart';

class PanierAchatCtrl extends GetxController {
  var state = PanierAchatState().obs;
  /* recuperer les tous */
  void getAll() async {
    AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();

    User? user = await apiUser.getUser();
    state.update((val) {
      val?.user = user;
      val?.loading = true;
      val?.hasData = false;
      val?.paniers = [];
      val?.visible = false;
    });

    print("id ${state.value.user!.toJson()}");
    PanierServiceNetworkImpl api = PanierServiceNetworkImpl();

    var data = await api.getAll(state.value.user!.id);

    if (data != null) {
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.paniers = data;
        val?.visible = true;
      });
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.paniers = [];
        val?.visible = false;
      });
    }
  }

  /* recuperer l'utilisateur */
  void getUser() async {
    AuthServiceLocalImpl api = AuthServiceLocalImpl();

    User? user = await api.getUser();

    state.update((val) {
      val?.user = user;
    });
  }
}
