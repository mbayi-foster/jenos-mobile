import 'package:get/get.dart';
import 'package:jenos_app/api/network/details_service_network_impl.dart';
import 'package:jenos_app/controllers/details/plat/details_plat_page_state.dart';
import 'package:jenos_app/models/principals/plat.dart';

class DetailsPlatCtrl extends GetxController {
  var state = DetailsPlatPageState().obs;

  void getPlat(String id) async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.visible = false;
    });

    DetailsServiceNetworkImpl api = DetailsServiceNetworkImpl();

    var data = await api.getPlat(id);

    if (data != null) {
      Plat plat = Plat.fromJson(data as Map<String, dynamic>);
      double prix = state.value.qte * plat.prix;
      String prixArrondi = prix.toStringAsFixed(2);
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.visible = true;
        val?.plat = plat;
        val?.prix = double.parse(prixArrondi);
      });
      //print("le nom du plat est : $data");
    } else {
      state.update((val) {
        val?.loading = false;
        val?.hasData = false;
        val?.visible = false;
        val?.plat = null;
      });
    }
  }

  void changeQte(bool plusOrMoins, double prix) {
    if (plusOrMoins) {
      state.update((val) {
        val?.qte++;
        double price = state.value.qte * prix;
        String prixArrondi = price.toStringAsFixed(2);
        val?.prix = double.parse(prixArrondi);
      });
    }
    if (!plusOrMoins && state.value.qte > 1) {
      state.update((val) {
        val?.qte--;
        double price = state.value.qte * prix;
        String prixArrondi = price.toStringAsFixed(2);
        val?.prix = double.parse(prixArrondi);
      });
    }

    // print("changement : ${state.value.qte} et valeur $plusOrMoins");
  }
}
