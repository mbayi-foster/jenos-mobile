import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jenos_app/models/principals/place.dart';
import 'package:jenos_app/views/components/inputs/input_location_search.dart';
import 'package:jenos_app/views/components/texts/text_title.dart';
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
                readOnly: false,
              ),
              const SizedBox(height: 10,),
              _places(state)
            ],
          ),
        ),
      );
    });
  }

  _places(Rx<SearchAdressPageState> state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for(Place place in state.value.places)
          Text("${place.nom}"),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
