import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/utils/padding.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/cards/plats.dart';
import 'package:jenos_app/views/components/chargement.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/plats/search/search_page_ctrl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static String path = '/search';
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageCtrl ctrl = Get.put(SearchPageCtrl());
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Rechercher des plats"),
          actions: const [PanierButton()],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: InputSearch(
              ctrl: controller,
              autoFocus: state.value.autoFocus,
              onChange: (value) {
                setState(() {
                  controller.text = value;
                });
                ctrl.search(value);
              },
              readOnly: false,
            ),
          ),
          25.ph,
          if (state.value.isVisible)
            Expanded(
              child: ListView.builder(
                  itemCount: state.value.plats.length,
                  itemBuilder: (context, index) {
                    Plat plat = state.value.plats[index];
                    return Column(
                      children: [
                        Plats(
                            tap: () {
                              Get.toNamed('/plat/${plat.id}');
                            },
                            plat: plat),
                        10.ph
                      ],
                    );
                  }),
            ),
          if (!state.value.isVisible)
            SizedBox(
                height: height * 0.7,
                child: Center(
                    child: Chargement(
                  loading: state.value.loading,
                  hasData: state.value.hasData,
                  msg: (state.value.noGet)
                      ? "Aucun plat trouvé pour ${state.value.search}"
                      : "Aucun plat trouvé",
                )))
        ]),
      );
    });
  }

  // _plats(Rx<SearchPageState> state) {
  //   List<Plat> plats = state.value.plats;
  //   return ListView.builder(
  //     itemCount: plats.length,
  //     itemBuilder: (context, index) {
  //       return Text(plats[index].nom);
  //     },
  //   );
  // }
}
