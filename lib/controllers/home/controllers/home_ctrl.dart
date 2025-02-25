import 'package:get/get.dart';
import 'package:jenos_app/api/network/acceuil_service_network_impl.dart';
import 'package:jenos_app/controllers/home/states/home_page_state.dart';
import 'package:jenos_app/models/principals/plat.dart';

class HomeCtrl extends GetxController {
  var state = HomePageState().obs;

  void fetchData() async {
    state.update((val) {
      val?.loading = true;
      val?.hasData = false;
      val?.visible = false;
    });
    AcceuilServiceNetworkImpl api = AcceuilServiceNetworkImpl();
    var data = await api.home();

    if (data != null) {
      List<dynamic> platsRecents = data['plat_recents'];
      List<dynamic> platsPops = data['plat_pops'];
      List<dynamic> platsMostPops = data['plat_most_pops'];

      List<Plat> recents =
          platsRecents.map((plat) => Plat.fromJson(plat)).toList();
      List<Plat> pops = platsPops.map((plat) => Plat.fromJson(plat)).toList();
      List<Plat> mostPops =
          platsMostPops.map((plat) => Plat.fromJson(plat)).toList();
      /* // Traitez les plats récents
      print("Plats récents:");
      for (var plat in platsRecents) {
        recents.add(Plat.fromJson(plat));
        print('ID: ${plat['id']}, Nom: ${plat['nom']}, Prix: ${plat['prix']}');
      }

      // Traitez les plats populaires
      print("\nPlats populaires:");
      for (var plat in platsPops) {
        pops.add(Plat.fromJson(plat));
        print('ID: ${plat['id']}, Nom: ${plat['nom']}, Prix: ${plat['prix']}');
      }
 */
      // Traitez les plats les plus populaires
      print("\nPlats les plus populaires:");
      for (var plat in platsMostPops) {
        mostPops.add(Plat.fromJson(plat));
        print('ID: ${plat['id']}, Nom: ${plat['nom']}, Prix: ${plat['prix']}, Photo : ${plat['photo']}');
      }

      /* state.copyWith(
          loading: false,
          hasData: true,
          visible: true,
          platMostPops: mostPops,
          platPops: pops,
          platRecents: recents);
      update(); */
      state.update((val) {
        val?.loading = false;
        val?.hasData = true;
        val?.visible = true;
        val?.platRecents = recents;
        val?.platPops = pops;
        val?.platMostPops = mostPops;
      });
    }
  }
}
