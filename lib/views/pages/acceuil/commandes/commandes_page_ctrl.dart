import 'package:get/get.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/views/pages/acceuil/commandes/commandes_page_state.dart';

class CommandesPageCtrl extends GetxController {
  var state = CommandesPageState().obs;

  /* recuperation des commandes */

  @override
  void onInit() async {
    // Récupérer les arguments et les assigner à l'observable
    state.value.commandes = [];
    AuthServiceLocalImpl api = AuthServiceLocalImpl();
    User? user = await api.getUser();
    state.update((val) {
      val?.user = user;
    });
    super.onInit();
  }
}
