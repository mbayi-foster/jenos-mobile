import 'package:get/get.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page_state.dart';
import 'package:jenos_app/views/pages/commandes/panier_achat/panier_achat_ctrl.dart';

class MaCommandePageCtrl extends GetxController {
  var state = MaCommandePageState().obs;
  final PanierAchatCtrl panierCtrl = Get.find<PanierAchatCtrl>();

  void getPanier() async {
    state.update((val) {
      val?.paniers = panierCtrl.state.value.checkList;
    });
  }
}
