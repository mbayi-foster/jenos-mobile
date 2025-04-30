import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/api/network/panier_service_network_impl.dart';
import 'package:jenos_app/models/principals/commande.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/acceuil/commandes/commandes_page_state.dart';

class CommandesPageCtrl extends GetxController {
  var state = CommandesPageState().obs;

  /* recuperation des commandes */

  @override
  void onInit() async {
    state.update((val) {
      val?.loading = true;
      val?.visible = false;
      val?.hasData = false;
    });
    AuthServiceLocalImpl apiUser = AuthServiceLocalImpl();
    User? user = await apiUser.getUser();
    PanierServiceNetworkImpl api = PanierServiceNetworkImpl();
    List<Commande> commandes = await api.getAllCommandes(user?.id ?? 0);
    if (commandes.isNotEmpty) {
      state.update((val) {
        val?.loading = false;
        val?.visible = true;
        val?.hasData = true;
        val?.commandes = commandes;
      });
    } else {
      state.update((val) {
        val?.loading = false;
        val?.visible = false;
        val?.hasData = false;
      });
    }
    super.onInit();
  }
}
