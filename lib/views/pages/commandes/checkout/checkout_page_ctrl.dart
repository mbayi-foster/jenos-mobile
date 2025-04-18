import 'package:get/get.dart';
import 'package:jenos_app/views/pages/commandes/checkout/checkout_page_state.dart';

class CheckoutPageCtrl extends GetxController {
  var state = CheckoutPageState().obs;

  // changement methode de paiement
  void changePaiement(String type) {
    state.update((val) {
      val?.paiement = type;
    });
  }
}
