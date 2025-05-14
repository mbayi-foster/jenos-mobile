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

    List<Panier> data = await api.getAll(state.value.user!.id);
    print("paniers");
    data.map((val) {
      print('panier : ${val.toJson()}');
    });
    if (data.isNotEmpty) {
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

/* checker un élèment du panier */
  void check(Panier panier) {
    List<Panier> ids = List.from(state.value.checkList);
    double prix = state.value.prix;
    if (ids.contains(panier)) {
      // Si l'ID existe, le retirer
      ids.remove(panier);
      prix -= panier.prix;
    } else {
      // Sinon, l'ajouter
      ids.add(panier);
      prix += panier.prix;
    }
    state.update((val) {
      val?.checkList = ids;
      val?.prix = prix;
    });
  }

/* checker tous les élèments du panier */
  void allCheck() {
    for (Panier panier in state.value.paniers) {
      check(panier);
    }
  }

/* créer une commande */
  List<Panier> commander() {
    List<Panier> paniers = state.value.checkList;
    return paniers;
  }
}
