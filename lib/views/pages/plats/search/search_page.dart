import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/plat.dart';
import 'package:jenos_app/views/components/buttons/panier_button.dart';
import 'package:jenos_app/views/components/inputs/input_search.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
import 'package:jenos_app/views/pages/plats/search/search_page_ctrl.dart';
import 'package:jenos_app/views/pages/plats/search/search_page_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageCtrl ctrl = Get.put(SearchPageCtrl());
  @override
  Widget build(BuildContext context) {
    var state = ctrl.state;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextTitle(title: "Rechercher des plats"),
          actions: const [PanierButton()],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            InputSearch(
              autoFocus: state.value.autoFocus,
              onChange: (value) {},
              readOnly: false,
            ),
            
          ]),
        ),
      );
    });
  }

  _plats(Rx<SearchPageState> state) {
    List<Plat> plats = state.value.plats;
    return ListView.builder(
      itemCount: plats.length,
      itemBuilder: (context, index) {
        return Text(plats[index].nom);
      },
    );
  }
}
