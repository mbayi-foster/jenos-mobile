import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/utils/colors.dart';
import 'package:jenos_app/views/components/inputs/input_location_search.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page.dart';
import 'package:jenos_app/views/pages/maps/configure_adresse/configure_adresse_page_ctrl.dart';
import 'package:jenos_app/views/pages/maps/search/search_adress_page_ctrl.dart';
import 'package:jenos_app/views/pages/maps/search/search_adress_page_state.dart';

class SearchAdressPage extends StatefulWidget {
  const SearchAdressPage({super.key});

  @override
  State<SearchAdressPage> createState() => _SearchAdressPageState();
}

class _SearchAdressPageState extends State<SearchAdressPage> {
  SearchAdressPageCtrl ctrl = Get.put(SearchAdressPageCtrl());
  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Recherche par nom"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InputLocationSearch(
                onChange: (value) {
                  if (value.length >= 3) {
                    ctrl.search(value);
                  }
                },
                autoFocus: true,
                readOnly: false,
              ),
              const SizedBox(
                height: 10,
              ),
              if (!state.value.loading && state.value.hasData == "okay")
                Expanded(child: _places(state)),
              if (state.value.loading || state.value.hasData == "en_cours")
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.value.loading)
                        CircularProgressIndicator(
                          color: MyColors.primary,
                        ),
                      if (!state.value.loading && state.value.hasData == "not")
                        TextTitle(title: "Aucun lieu trouvé!")
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  _places(Rx<SearchAdressPageState> state) {
    List<Place> places = state.value.places;
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
                onTap: () {
                  debugPrint("adresse choisi : ${places[index].toJson()}");
                  Get.off(() => const ConfigureAdressePage(),
                      arguments: {'location': places[index]});
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ClipRRect(
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextTitle(title: "${places[index].nom}"),
                      ),
                    ),
                  ), /* child: Text("${place.nom}") */
                )),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
