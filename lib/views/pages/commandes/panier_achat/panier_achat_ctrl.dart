import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/panier_service_network_impl.dart';
import 'package:jenos_app/models/principals/panier.dart';
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

    PanierServiceNetworkImpl api = PanierServiceNetworkImpl();

    var data = await api.getAll(state.value.user!.id);

    if (data != null) {
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.paniers = data;
        val?.visible = true;
      });
      for (Panier panier in data) {
        print("un panier est : ${panier.toJson()}");
      }
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

  void check(Panier panier) {
    List<int> ids = List.from(state.value.checkList);
    double prix = state.value.prix;
    if (ids.contains(panier.id)) {
      // Si l'ID existe, le retirer
      ids.remove(panier.id);
      prix -= panier.prix;
    } else {
      // Sinon, l'ajouter
      ids.add(panier.id);
      prix += panier.prix;
    }
    state.update((val) {
      val?.checkList = ids;
      val?.prix = prix;
    });
  }

  void allCheck() {
    for (Panier panier in state.value.paniers) {
      check(panier);
    }
  }
}
