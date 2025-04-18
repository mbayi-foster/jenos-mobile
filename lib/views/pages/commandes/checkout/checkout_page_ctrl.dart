import 'package:get/get.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_state.dart';

class CheckoutPageCtrl extends GetxController {
  var state = CheckoutPageState().obs;

  @override
  void onInit() {
    // Récupérer les arguments et les assigner à l'observable
    var args = Get.arguments;
    print('arguments : $args');
    super.onInit();
  }

  // changement methode de paiement
  void changePaiement(String type) {
    state.update((val) {
      val?.paiement = type;
    });
  }
}
