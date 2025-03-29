import 'package:get/get.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/views/pages/acceuil/commandes/commandes_page_state.dart';

class CommandesPageCtrl extends GetxController {
  var state = CommandesPageState().obs;

  /* recuperation des commandes */

  @override
  void onInit() {
    // Récupérer les arguments et les assigner à l'observable
    state.value.paniers = Get.arguments;
    super.onInit();

  }
}
