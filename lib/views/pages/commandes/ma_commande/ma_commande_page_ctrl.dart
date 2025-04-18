import 'package:get/get.dart';
import 'package:jenos_app/models/principals/panier.dart';
import 'package:jenos_app/views/pages/commandes/ma_commande/ma_commande_page_state.dart';

class MaCommandePageCtrl extends GetxController {
  var state = MaCommandePageState().obs;

  @override
  void onInit() {
    // Récupérer les arguments et les assigner à l'observable
    state.value.paniers = Get.arguments;
    

    for (Panier panier in state.value.paniers) {
      double prix = state.value.prix;
      state.value.prix = prix + panier.prix;
    }

    state.value.prixTotal = state.value.prix;
    super.onInit();
  }

/* ajouter la note */
  void getNote(String note) {
    state.update((val) {
      val?.note = note;
    });
  }

  /* retirer la note */
  void retireNote() {
    state.update((val) {
      val?.note = "";
    });
  }

  Map<String, dynamic> commander() {
    List<int> ids = state.value.paniers.map((e) => e.id).toList();
    return {
      'paniers': ids,
      'prix': state.value.prixTotal,
      'note': state.value.note
    };
  }
}
