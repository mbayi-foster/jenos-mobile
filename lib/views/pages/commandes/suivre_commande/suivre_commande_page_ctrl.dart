import 'package:get/get.dart';
import 'package:jenos_app/views/pages/commandes/suivre_commande/suivre_commande_page_state.dart';

class SuivreCommandePageCtrl extends GetxController {
  var state = SuivreCommandePageState().obs;

  @override
  void onInit() {
    final String id = Get.parameters['id'] ?? '0';
    state.update((val) {
      val?.id = int.parse(id);
    });
    super.onInit();
  }
}
